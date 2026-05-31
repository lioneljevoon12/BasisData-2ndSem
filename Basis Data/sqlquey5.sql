-- Hapus data Nilai terlebih dahulu (tabel anak) sebelum Mahasiswa (tabel induk)
DELETE FROM Nilai WHERE NilaiID = 302;
-- Hapus data Kelas tertentu
DELETE FROM Kelas WHERE KelasID = 204;
-- Menambahkan data baru untuk menggantikan yang dihapus
INSERT INTO Mahasiswa (MahasiswaID, Nama, Alamat, TanggalLahir, NoHP)
VALUES (6, 'Gita Pratiwi', 'Semarang', '2002-12-15', '085755553333');
INSERT INTO Dosen (DosenID, Nama, Email, NoHP)
VALUES (15, 'Dr. Rahmat Hidayah', 'rahmat.hidayah@univ.ac.id', '081299988877');
INSERT INTO MataKuliah (MataKuliahID, NamaMK, SKS, Semester)
VALUES (105, 'Kecerdasan Buatan', 3, 5);
INSERT INTO Kelas (KelasID, MataKuliahID, DosenID, TahunAkademik)
VALUES (206, 105, 15, '2024/2025');
INSERT INTO Nilai (NilaiID, MahasiswaID, KelasID, Nilai)
VALUES (306, 6, 206, 91.0);