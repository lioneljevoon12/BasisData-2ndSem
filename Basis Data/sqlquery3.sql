-- Menampilkan seluruh data dari setiap tabel
SELECT * FROM Mahasiswa;
SELECT * FROM Dosen;
SELECT * FROM MataKuliah;
SELECT * FROM Kelas;
SELECT * FROM Nilai;

-- Menampilkan kolom tertentu dari tabel Mahasiswa
SELECT MahasiswaID, Nama, Alamat FROM Mahasiswa;
-- Menampilkan mahasiswa yang berasal dari Surabaya


-- Menampilkan mahasiswa diurutkan berdasarkan Nama A-Z
SELECT * FROM Mahasiswa ORDER BY Nama ASC;
-- Menampilkan mahasiswa dengan nilai di atas 85
SELECT m.Nama, n.Nilai
FROM Mahasiswa m
JOIN Nilai n ON m.MahasiswaID = n.MahasiswaID
WHERE n.Nilai > 85;

select * FROM Mahasiswa;