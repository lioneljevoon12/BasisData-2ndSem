-- ============================================
-- INSERT DATA MAHASISWA BARU
-- ============================================
INSERT INTO Mahasiswa (MahasiswaID, Nama, Alamat, TanggalLahir, NoHP)
VALUES
 (1, 'Ali Fauzan', 'Surabaya', '2000-01-15', '081234567890'),
 (2, 'Budi Santoso', 'Malang', '1999-05-22', '082345678901'),
 (3, 'Citra Lestari', 'Sidoarjo', '2001-03-10', '083456789012'),
 (4, 'Deni Kurniawan','Gresik', '2000-07-25', '084567890123'),
 (5, 'Eka Putri', 'Lamongan', '2001-09-18', '085678901234');
-- ============================================
-- INSERT DATA DOSEN
-- ============================================
INSERT INTO Dosen (DosenID, Nama, Email, NoHP)
VALUES
 (10, 'Dr. Rina Widya', 'rina.widya@univ.ac.id', '081122334455'),
 (11, 'Dr. Yusuf Malik', 'yusuf.malik@univ.ac.id', '082233445566'),
 (12, 'Dr. Sinta Dewi', 'sinta.dewi@univ.ac.id', '083344556677'),
 (13, 'Dr. Arif Hidayat', 'arif.hidayat@univ.ac.id', '084455667788'),
 (14, 'Dr. Lestari Nur', 'lestari.nur@univ.ac.id', '085566778899');
-- ============================================
-- INSERT DATA MATA KULIAH
-- ============================================
INSERT INTO MataKuliah (MataKuliahID, NamaMK, SKS, Semester)
VALUES
 (100, 'Basis Data', 3, 4),
 (101, 'Algoritma dan Pemrograman', 3, 2),
 (102, 'Matematika Diskrit', 2, 2),
 (103, 'Sistem Operasi', 3, 3),
 (104, 'Jaringan Komputer', 2, 4);
-- ============================================
-- INSERT DATA KELAS (memerlukan MataKuliahID & DosenID yang valid)
-- ============================================
INSERT INTO Kelas (KelasID, MataKuliahID, DosenID, TahunAkademik)
VALUES
 (201, 100, 10, '2024/2025'),
 (202, 101, 11, '2024/2025'),
 (203, 102, 12, '2024/2025'),
 (204, 103, 13, '2024/2025'),
 (205, 104, 14, '2024/2025');
-- ============================================
-- INSERT DATA NILAI (memerlukan MahasiswaID & KelasID yang valid)
-- ============================================
INSERT INTO Nilai (NilaiID, MahasiswaID, KelasID, Nilai)
VALUES
 (301, 1, 201, 85.5),
 (302, 2, 202, 90.0),
 (303, 3, 203, 78.0),
 (304, 4, 204, 88.0),
 (305, 5, 205, 92.5);

INSERT INTO Kelas (KelasID, MataKuliahID, DosenID, TahunAkademik)
VALUES
 (206, 100, 10, '2025/2026');

INSERT INTO Kelas (KelasID, MataKuliahID, DosenID, TahunAkademik)
VALUES
 (210, 100, 10, '2025/2026');

 SELECT * FROM Nilai;