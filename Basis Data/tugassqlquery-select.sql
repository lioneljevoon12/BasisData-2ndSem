SELECT Nama, Alamat FROM Mahasiswa WHERE Alamat = 'Malang';

SELECT Nama, TanggalLahir FROM Mahasiswa ORDER BY Nama ASC;

SELECT Nama, Email, NoHP FROM Dosen ORDER BY Nama DESC;

SELECT * FROM Nilai WHERE Nilai > 80 ORDER BY Nilai DESC;

SELECT Mahasiswa.Nama, Nilai.Nilai
FROM Mahasiswa
JOIN Nilai ON Mahasiswa.MahasiswaID = Nilai.MahasiswaID
WHERE Nilai.Nilai >= 90;