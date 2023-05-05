Berikut adalah tabel yang terdapat dalam sistem informasi pelatihan pegawai, yang telah dinormalisasi hingga 3NF:

Tabel Kegiatan Pelatihan
id_kegiatan (PK)
nama_kegiatan
tanggal_mulai
tanggal_selesai
deskripsi
lokasi
Tabel Peserta Pelatihan
id_peserta (PK)
nama_peserta
jenis_kelamin
alamat
surel
telepon
id_kegiatan (FK)
Tabel Narasumber
id_narasumber (PK)
nama_narasumber
spesialisasi
Tabel Materi Pelatihan
id_materi (PK)
nama_materi
id_narasumber (FK)
Tabel Presensi
id_presensi (PK)
id_peserta (FK)
id_kegiatan (FK)
tanggal
hadir (Boolean)


dari narasi diatas table apa saja yang terdapat didalam aplikasi tersebut(buatkan normalisasi menjadi 3 NF) dan buatkan desain database menggunakan mysqlworkbench

ChatGPT
​

Tabel kegiatan_pelat
id_kegiatan (kunci utama)
nama_kegiatan
tanggal_pelaksanaan
lokasi_pelaksanaan
Tabel peserta_pelatihan:
id_peserta (kunci utama)
nama_peserta
alamat_peserta
email_peserta
Sumber tabel:
id_narasumber (kunci utama)
nama_narasumber
keahlian_narasumber
T
id_materi (kunci utama)
pengenal
pengenal
judul_materi
deskripsi_materi
Tabel presensi_pelatihan:
pengenal
pengenal
pengenal
pengenal
tanggal_presensi
status_kehadiran
Normal

Tabel kegiatan_pelatihan:
id_kegiatan (kunci utama)
nama_kegiatan
tanggal_pelaksana
lokasi_pelaksanaan
Tabel peserta_pelatihan:
id_peserta (kunci utama)
nama_peserta
alamat_peserta
email_peserta
Sumber tabel:
id_narasumber (primary key
nama_narasumber
keahlian_narasumber
Tabel bahan_pelat
id_materi (kunci utama
pengenal
id_naras
judul_materi
meja
Tabel kehadiran
id_presensi (kunci utama)
pengenal
pengenal
tanggal_presensi
status_kehadiran
Des

B
K
T
Pada
Sim



