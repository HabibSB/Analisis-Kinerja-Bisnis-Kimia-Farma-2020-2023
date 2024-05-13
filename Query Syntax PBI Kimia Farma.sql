----Buat Tabel untuk menyimpan hasil analisa,dengan nama tabel datamart.
CREATE TABLE dataset_kimia_farma.datamart AS

----Memilih kolom kolom yang dibutuhkan untuk datamart pada ke empat kolom yang sudah diimport ke bigquery, dilakukan dengan melakukan left join antara tabel final transaksi (karena ingin menampilkan semua data dari tabel ini) dengan ketiga tabel lainnya (menampilkan nilai yang sesuai dengan tabel final transaction, dengan kolom branch_id dan product_id sebagai foreign key, sedangkan primary keyntta adalah transaction_id)
SELECT trs.transaction_id,trs.date,trs.branch_id,kcg.branch_name,kcg.kota,kcg.provinsi,kcg.rating as rating_cabang,trs.customer_name,trs.product_id,prd.product_name,trs.price as actual_price,CAST(trs.discount_percentage AS DECIMAL) AS discount_percentage
FROM `dataset_kimia_farma.kf_final_transaction`AS trs
LEFT JOIN `dataset_kimia_farma.kf_kantor_cabang`AS kcg 
  ON trs.branch_id=kcg.branch_id
LEFT JOIN `dataset_kimia_farma.kf_product`AS prd
  ON trs.product_id=prd.product_id;


---- Kemudian membuat kolom baru untuk persentase gross laba dan menghitung nilai dari kolom tersebut dengan case statement, kemudian melakukan update pada kolom yang telah dibuat
ALTER TABLE dataset_kimia_farma.datamart
ADD column persentase_gross_laba DECIMAL ;

UPDATE `dataset_kimia_farma.datamart`
SET persentase_gross_laba =
 CASE 
    WHEN Actual_price <=50000 THEN CAST(0.10 AS DECIMAL)
    WHEN Actual_price > 50000 AND Actual_price <= 100000 THEN CAST(0.15 AS DECIMAL)
    WHEN Actual_price > 100000 AND Actual_price <= 300000 THEN CAST(0.20 AS DECIMAL)
    WHEN Actual_price > 300000 AND Actual_price < 500000 THEN CAST(0.25 AS DECIMAL)
    ELSE CAST(0.30 AS DECIMAL)
END
WHERE actual_price IS NOT NULL;

----Membuat kolom baru yaitu nett_sales dan nett_profit, kemudian melakukan agregasi untuk mendapat nilai dengan syntax dibawah ini.Kemudian melakukan update pada kolom yang telah dibuat.
ALTER TABLE dataset_kimia_farma.datamart
ADD column nett_sales DECIMAL ;

UPDATE dataset_kimia_farma.datamart
SET nett_sales = actual_price - (actual_price * discount_percentage)
WHERE actual_price IS NOT NULL;

ALTER TABLE dataset_kimia_farma.datamart
ADD column nett_profit DECIMAL ;

UPDATE dataset_kimia_farma.datamart AS dm
SET nett_profit = dm.nett_sales - (
    SELECT nett_sales * persentase_gross_laba
    FROM dataset_kimia_farma.datamart AS sub
    WHERE sub.transaction_id = dm.transaction_id
)
WHERE dm.actual_price IS NOT NULL;


----  Tabel analisa sudah lengkap dan siap untuk di buat dashboard.

CREATE TABLE dataset_kimia_farma.datamart_rakamin_kf_analytics AS
SELECT dt.transaction_id,dt.date,dt.branch_id,dt.branch_name,dt.kota,dt.provinsi,dt.rating_cabang,dt.customer_name,dt.product_id,dt.product_name,dt.actual_price,dt.discount_percentage,dt.persentase_gross_laba,dt.nett_sales,dt.nett_profit,ts.rating as rating_transaksi
FROM `dataset_kimia_farma.datamart`AS dt
INNER JOIN `dataset_kimia_farma.kf_final_transaction`as ts
ON dt.transaction_id=ts.transaction_id;


DROP TABLE dataset_kimia_farma.datamart;




