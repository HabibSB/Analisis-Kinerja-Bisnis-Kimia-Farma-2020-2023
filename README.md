# Analisis-Kinerja-Bisnis-Kimia-Farma-2020-2023
## Project Portofolio
Sebagai seorang Big Data Analytics Intern di Kimia Farma, kegiatan yang dilakukan mencakup serangkaian tantangan yang memerlukan pemahaman mendalam tentang data dan kemampuan analisis. Salah satu proyek utama adalah mengevaluasi kinerja bisnis Kimia Farma dari tahun 2020 hingga 2023. Pada proyek ini,ditugaskan untuk mengimpor dataset yang telah disediakan, membuat tabel analisa berdasarkan hasil aggregasi dari ke-empat tabel yang sudah diimport sebelumnya, dan membuat sebuah dashboard analisis kinerja Kimia Farma tahun 2020-2023 di Google Looker Studio. Dashboard ini dibuat berdasarkan tabel analisa yang telah dibuat sebelumnya pada BigQuery, sehingga perlu menghubungkan table tersebut ke Google Looker Studio.Langkah-langlah pekerjaan sebagai berikut.
1. Importing dataset ke bigquery
   Pada proyek ini  ditugaskan untuk mengimpor dataset yang telah disediakan yaitu  kf_final_transaction.csv, kf_inventory.csv, kf_kantor_cabang.csv ,kf_product.csv.
Membuat dataset baru dengan nama dataset_kimia_farma , kemudian mengimport keempat dataset tersebut untuk menjadi tabel pada BigQuery, memberi nama tabelnya dengan nama dari dataset, namun tanpa ".csv

2. Tabel Analisa (Datamart)
Pada proyek ini, diminta untuk membuat tabel analisa berdasarkan hasil aggregasi dari ke-empat tabel yang sudah diimport sebelumnya.untuk membuat tabel Analisa berdasarkan hasil aggregasi dari ke-empat tabel, dilakukan menggunakan Google Bigquery https://github.com/HabibSB/Analisis-Kinerja-Bisnis-Kimia-Farma-2020-2023/blob/main/Query%20Syntax%20PBI%20Kimia%20Farma.sql
3. Dasboard
membuat sebuah dashboard analisis kinerja Kimia Farma tahun 2020-2023 di Google Looker Studio. Dashboard ini dibuat berdasarkan tabel analisa yang telah dibuat sebelumnya pada BigQuery(datamart), sehingga  perlu menghubungkan table tersebut ke Google Looker Studio. Tujuan dari dashboard ini adalah memberikan pandangan holistik terhadap kinerja pendapatan Kimia Farma selama periode 2020 hingga 2023. Dengan merinci data keuangan cabang-cabang, dashboard ini bertujuan untuk: melacak tren pendapatan,memahami kontribusi cabang, analisis regional, dan penilaian kinerja keuangan umum
https://lookerstudio.google.com/u/0/reporting/55758568-499a-4935-b30d-8bb5c3acc1ae/page/tEnnC
