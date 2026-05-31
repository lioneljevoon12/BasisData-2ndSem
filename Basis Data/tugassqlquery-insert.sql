INSERT INTO Mahasiswa (MahasiswaID, Nama, Alamat, TanggalLahir, NoHP) VALUES
(7, 'Franz Abednego', 'Surabaya', '2003-01-10', '081111111111'),
(8, 'Siti Aminah', 'Malang', '2003-05-20', '082222222222'),
(9, 'Andi Wijaya', 'Gresik', '2002-11-30', '083333333333');

INSERT INTO Dosen (DosenID, Nama, Email, NoHP) VALUES
(16, 'Prof. Budi Darmawan', 'budi.darmawan@univ.ac.id', '081234567890'),
(17, 'Dr. Siti Nurhaliza', 'siti.nurhaliza@univ.ac.id', '082345678901'),
(18, 'Ir. Joko Susilo', 'joko.susilo@univ.ac.id', '083456789012');

INSERT INTO MataKuliah (MataKuliahID, NamaMK, SKS, Semester) VALUES
(106, 'Pemrograman Mobile', 3, 3),
(107, 'Jaringan Komputer', 3, 4),
(108, 'Sistem Operasi', 3, 2);

INSERT INTO Kelas (KelasID, MataKuliahID, DosenID, TahunAkademik) VALUES
(207, 106, 16, '2024/2025'),
(208, 107, 17, '2024/2025'),
(209, 108, 18, '2024/2025');

INSERT INTO Nilai (NilaiID, MahasiswaID, KelasID, Nilai) VALUES
(307, 7, 207, 85.5),
(308, 8, 208, 90.0),
(309, 9, 209, 78.0);

SELECT * FROM Mahasiswa;
SELECT * FROM Dosen;
SELECT * FROM MataKuliah;
SELECT * FROM Kelas;
SELECT * FROM Nilai;