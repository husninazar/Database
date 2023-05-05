CREATE TRIGGER update_status_pembayaran
AFTER INSERT ON pembayaran
FOR EACH ROW
BEGIN
    DECLARE total_bayar INT;
    SELECT SUM(harga * jumlah) INTO total_bayar FROM pesanan WHERE id_pelanggan = NEW.id_pelanggan;
    IF total_bayar <= NEW.jumlah_bayar THEN
        UPDATE pembayaran SET status_pembayaran = 'Lunas' WHERE id = NEW.id;
    END IF;
END;
