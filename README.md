# Worksheet Praktikum Linux — SO Sesi 5
**Mata Kuliah:** Sistem Operasi (MITI.202 / MISI.202)  
**Kelas:** TIK.25 + SIF.25 Sentul (gabungan)  
**Nama / Akun GitHub:** ubuntu / (Ganti dengan Username GitHub Anda)

---

## 🛠️ Tugas Persiapan — Analisis & Validasi Data

### 1. Bukti Koneksi SSH & Status OpenSSH Server
Akses remote dari Windows menggunakan Git Bash menuju VM Ubuntu (Linux Box) telah berhasil dikonfigurasi melalui IP lokal. Layanan `openssh-server` dipastikan aktif dan berjalan di latar belakang menggunakan perintah:
`sudo systemctl enable --now ssh`

### 2. Catatan Singkat: Kelebihan & Kekurangan `scp` vs `rsync`
Berdasarkan dokumentasi praktikum dan uji coba pengiriman berkas:

*   **`scp` (Secure Copy):**
    *   *Kelebihan:* Sangat mudah digunakan untuk menyalin satu berkas tunggal secara cepat tanpa parameter rumit.
    *   *Kekurangan:* Tidak efisien untuk folder besar karena jika koneksi terputus, proses pengiriman harus diulang dari awal (tidak mendukung *incremental resume*).
*   **`rsync` (Remote Sync):**
    *   *Kelebihan:* Menggunakan algoritma *delta transfer* (hanya mengirim bagian berkas yang berubah saja), memiliki visualisasi *progress bar*, dan mampu mempertahankan status perizinan (*permission/timestamp*) berkas asal.
    *   *Kekurangan:* Struktur perintah (*syntax*) sedikit lebih kompleks bagi pengguna baru.

---

## 📂 Struktur Repositori Tugas
Berikut adalah ringkasan pohon berkas yang berhasil diolah menggunakan perkakas baris perintah (`shell tools` seperti `awk`, `sed`, `grep`, dan `jq`):

```text
praktikum-linux-sesi5/
├── README.md (Catatan pengerjaan, kesulitan, refleksi)
├── exercise-1-csv/
│   ├── data.csv (Raw output data customer)
│   ├── solution.sh (Perintah shell penyeleksian & normalisasi data)
│   └── output/
│       ├── soal1.txt (Distribusi status customer)
│       ├── soal2.csv (Normalisasi tanggal ISO 8601)
│       ├── gmail-customers.csv (Filter domain gmail)
│       ├── soal4.csv (Deduplikasi data email)
│       └── soal5.txt (Pencarian typo capitalization)
├── exercise-2-nginx/
│   ├── access.log (Log server Nginx)
│   └── solution.sh (Skrip top IP & error rate extraction)
├── exercise-3-json/
│   ├── orders.jsonl (Data manifest belanjaan JSON)
│   └── solution.sh (Query ekstraksi spending via jq)
└── exercise-4-migration/
    ├── produk-lama.csv (Database usang & messy)
    └── migrate.sh (Pipeline pembersihan data otomatis)
```

---

## 📝 Refleksi & Kesimpulan Pengerjaan

1.  **Kesulitan Terbesar & Solusi:**  
    Kesulitan terbesar terletak pada penanganan format tanggal yang tidak konsisten di *Exercise 1* dan pembersihan simbol mata uang asing di *Exercise 4*. Masalah ini berhasil dipecahkan dengan memanfaatkan fitur *regular expression* (regex) tingkat lanjut pada utilitas `sed` dan kondisional pemrograman di dalam `awk`.
2.  **Perkakas / Teknik Baru yang Dipelajari:**  
    Mempelajari penggunaan manipulasi teks baris per baris tanpa membuka editor teks visual, penggunaan utilitas `jq` untuk memecah struktur data bersarang (*nested JSON Lines*), serta mekanisme *Port Forwarding / Bridged Network* pada mesin virtual VirtualBox.
3.  **Implementasi Nyata di Industri IT:**  
    Keahlian manipulasi teks via shell ini sangat krusial dalam profesi *DevOps Engineer* dan *System Administrator* untuk melakukan pemindaian berkas log sistem secara cepat saat terjadi insiden server, serta membantu *Data Engineer* dalam melakukan tahapan ETL (*Extract, Transform, Load*) mentahan data skala besar.

