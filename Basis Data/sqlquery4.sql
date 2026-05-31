-- UPDATE alamat mahasiswa (MahasiswaID = 1)
UPDATE Mahasiswa
SET Alamat = 'Jakarta Selatan'
WHERE MahasiswaID = 1;
-- UPDATE alamat mahasiswa lain
UPDATE Mahasiswa
SET Alamat = 'Sidoarjo Kota'
WHERE MahasiswaID = 2;
-- UPDATE jumlah SKS Mata Kuliah
UPDATE MataKuliah
SET SKS = 4
WHERE MataKuliahID = 100;
-- UPDATE nilai mahasiswa
UPDATE Nilai
SET Nilai = 95.0
WHERE NilaiID = 301;
-- Verifikasi hasil UPDATE
SELECT * FROM Mahasiswa;
SELECT * FROM Nilai;

UPDATE Mahasiswa
SET Alamat = 'Surabaya';

SELECT * FROM Mahasiswa
WHERE MahasiswaID = 1;

UPDATE Mahasiswa
SET Alamat = 'Bandung', NoHP = '081122223333'
WHERE MahasiswaID = 1;