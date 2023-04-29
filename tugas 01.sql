1. Buat table produk
CREATE TABLE produk (
  id_produk INT PRIMARY KEY,
  nama_produk VARCHAR(50),
  harga DECIMAL(10,2),
  stok INT
);

2. Buat table pesanan_items
CREATE TABLE pesanan_items (
  id_pesanan INT,
  id_produk INT,
  jumlah INT,
  FOREIGN KEY (id_pesanan) REFERENCES pesanan(id_pesanan),
  FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);


3. Buat table vendor
CREATE TABLE vendor (
  id_vendor INT PRIMARY KEY,
  nama_vendor VARCHAR(50),
  alamat VARCHAR(100),
  telepon VARCHAR(15)
);


4. Buat table Pembelian
CREATE TABLE pembelian (
  id_pembelian INT PRIMARY KEY,
  id_vendor INT,
  tanggal_pembelian DATE,
  total_harga DECIMAL(10,2),
  FOREIGN KEY (id_vendor) REFERENCES vendor(id_vendor)
);

5. Tambahkan kolom alamat pada pelanggan dengan tipe data varchar (40)
ALTER TABLE pelanggan
ADD COLUMN alamat VARCHAR(40);

6. Ubah kolom nama pada pelanggan menjadi nama_pelanggan
ALTER TABLE pelanggan
RENAME COLUMN nama TO nama_pelanggan;

7. edit tipe data nama_pelanggan menjadi varchar(50)
ALTER TABLE pelanggan
RENAME COLUMN nama TO nama_pelanggan;
