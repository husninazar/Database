1.	Tampilkan produk yang asset nya diatas 20jt
MariaDB [dbtoko1]> SELECT SUM(harga_beli * stok) as total from produk; //menghitung total asset
MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_beli * stok > 20000000; ini yang betul

SELECT ...
2.	Tampilkan data produk beserta selisih stok dengan minimal stok
MariaDB [dbtoko1]> SELECT SUM(stok - min_stok) as selisih from produk;
3.	Tampilkan total asset produk secara keseluruhan
MariaDB [dbtoko1]> SELECT sum(stok) as total_asset from produk;
4.	Tampilkan data pelanggan yang lahirnya antara tahun 1999 sampai 2004
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir) BETWEEN 1999 AND 2004;




1.	Berapa jumlah pelanggan yang tahun lahirnya 1998
2.	Berapa jumlah pelanggan perempuan yang tempat lahirnya di Jakarta
3.	Berapa jumlah total stok semua produk yang harga jualnya dibawah 10rb
4.	Ada berapa produk yang mempunyai kode awal K

	SELECT COUNT(*) as jumlah_pelanggan_1998 FROM pelanggan WHERE YEAR(tgl_lahir) = 1998;
	SELECT COUNT(*) as jumlah_pelanggan_perempuan_jakarta FROM pelanggan WHERE jenis_kelamin = 'Perempuan' AND tempat_lahir = 'Jakarta';
	SELECT SUM(stok) as total_stok FROM produk WHERE harga_jual < 10000;
	SELECT COUNT(*) as jumlah_produk_k FROM produk WHERE kode_produk LIKE 'K%';



1.	Tampilkan data produk : id, nama, stok dan informasi jika stok telah sampai batas minimal atau kurang dari minimum stok dengan informasi ‘segera belanja’ jika tidak ‘stok aman’.
2.	Tampilkan data pelanggan: id, nama, umur dan kategori umur : jika umur < 17 → ‘muda’ , 17-55 → ‘Dewasa’, selainnya ‘Tua’
3.	Tampilkan data produk: id, kode, nama, dan bonus untuk kode ‘TV01’ →’DVD Player’ , ‘K001’ → ‘Rice Cooker’ selain dari diatas ‘Tidak Ada’
	SELECT id, nama, stok, 
    CASE 
        WHEN stok <= min_stok THEN 'segera belanja'
        ELSE 'stok aman'
    END AS status_stok
FROM produk;
	
	SELECT id, nama, YEAR(CURDATE()) - YEAR(tgl_lahir) AS umur,
    CASE 
        WHEN YEAR(CURDATE()) - YEAR(tgl_lahir) < 17 THEN 'muda'
        WHEN YEAR(CURDATE()) - YEAR(tgl_lahir) BETWEEN 17 AND 55 THEN 'Dewasa'
        ELSE 'Tua'
    END AS kategori_umur
FROM pelanggan;
	SELECT id, nama, YEAR(CURDATE()) - YEAR(tgl_lahir) AS umur,
    CASE 
        WHEN YEAR(CURDATE()) - YEAR(tgl_lahir) < 17 THEN 'muda'
        WHEN YEAR(CURDATE()) - YEAR(tgl_lahir) BETWEEN 17 AND 55 THEN 'Dewasa'
        ELSE 'Tua'
    END AS kategori_umur
FROM pelanggan;



1.	Tampilkan data statistik jumlah tempat lahir pelanggan
2.	Tampilkan jumlah statistik produk berdasarkan jenis produk
3.	Tampilkan data pelanggan yang usianya dibawah rata usia pelanggan
4.	Tampilkan data produk yang harganya diatas rata-rata harga produk
	SELECT tempat_lahir, COUNT(*) as jumlah_pelanggan 
FROM pelanggan 
GROUP BY tempat_lahir;
	SELECT jenis_produk, COUNT(*) as jumlah_produk 
FROM produk 
GROUP BY jenis_produk;
	SELECT id, nama, YEAR(CURDATE()) - YEAR(tgl_lahir) AS umur 
FROM pelanggan 
WHERE YEAR(CURDATE()) - YEAR(tgl_lahir) < (SELECT AVG(YEAR(CURDATE()) - YEAR(tgl_lahir)) FROM pelanggan);
	SELECT id, nama, harga_jual 
FROM produk 
WHERE harga_jual > (SELECT AVG(harga_jual) FROM produk);
