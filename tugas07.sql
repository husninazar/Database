Buat fungsi inputPelanggan(), setelah itu panggil fungsinya

-- Buat fungsi showPelanggan(), setelah itu panggil fungsinya

-- Buat fungsi inputProduk(), setelah itu panggil fungsinya

-- Buat fungsi showProduk(), setelah itu panggil fungsinya

-- Buat fungsi totalPesanan(), setelah itu panggil fungsinya



-- tampilkan seluruh pesanan dari semua pelanggan



-- buatkan query panjang di atas menjadi sebuah view baru: pesanan_produk_vw (menggunakan join dari table pesanan,pelanggan dan produk)
CREATE FUNCTION inputPelanggan(nama VARCHAR(50), alamat VARCHAR(100), telepon VARCHAR(20))
RETURNS INT
BEGIN
    INSERT INTO pelanggan (nama, alamat, telepon) VALUES (nama, alamat, telepon);
    RETURN LAST_INSERT_ID();
END;

SELECT inputPelanggan('John Doe', 'Jl. Merdeka No. 123', '081234567890');
CREATE FUNCTION showPelanggan()
RETURNS TABLE
AS
RETURN
    SELECT * FROM pelanggan;

CREATE FUNCTION inputProduk(nama VARCHAR(50), harga DECIMAL(10,2), stok INT)
RETURNS INT
BEGIN
    INSERT INTO produk (nama, harga, stok) VALUES (nama, harga, stok);
    RETURN LAST_INSERT_ID();
END;

SELECT inputProduk('Laptop Asus', 8000000, 10);

CREATE FUNCTION showProduk()
RETURNS TABLE
AS
RETURN
    SELECT * FROM produk;
SELECT * FROM showProduk();

CREATE FUNCTION totalPesanan(id_pelanggan INT)
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(produk.harga * pesanan.jumlah) INTO total
    FROM pesanan
    JOIN produk ON pesanan.id_produk = produk.id
    WHERE pesanan.id_pelanggan = id_pelanggan;
    RETURN total;
END;

SELECT totalPesanan(1);

SELECT pelanggan.nama, produk.nama AS produk, pesanan.jumlah, produk.harga * pesanan.jumlah AS total_harga
FROM pesanan
JOIN pelanggan ON pesanan.id_pelanggan = pelanggan.id
JOIN produk ON pesanan.id_produk = produk.id;

CREATE VIEW pesanan_produk_vw AS
SELECT pelanggan.nama AS pelanggan, produk.nama AS produk, pesanan.jumlah, produk.harga * pesanan.jumlah AS total_harga
FROM pesanan
JOIN pelanggan ON pesanan.id_pelanggan = pelanggan.id
JOIN produk ON pesanan.id_produk = produk.id;

SELECT * FROM pesanan_produk_vw;
