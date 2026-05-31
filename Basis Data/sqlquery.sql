CREATE DATABASE AkademikDB2;
USE akademikdb2;

CREATE TABLE Mahasiswa (
    MahasiswaID INT PRIMARY KEY,
    Nama VARCHAR(100),
    Alamat TEXT,
    TanggalLahir DATE,
    NoHP VARCHAR(15)
);

CREATE TABLE Dosen (
    DosenID INT PRIMARY KEY,
    Nama VARCHAR(100),
    Email VARCHAR(100),
    NoHP VARCHAR(15)
);

CREATE TABLE MataKuliah (
    MataKuliahID INT PRIMARY KEY,
    NamaMK VARCHAR(100),
    SKS INT,
    Semester INT
);

CREATE TABLE Kelas (
    KelasID INT PRIMARY KEY,
    MataKuliahID INT,
    DosenID INT,
    TahunAkademik VARCHAR(10),
    FOREIGN KEY (MataKuliahID) REFERENCES MataKuliah(MataKuliahID),
    FOREIGN KEY (DosenID) REFERENCES Dosen(DosenID)
);

CREATE TABLE Nilai (
    NilaiID INT PRIMARY KEY,
    MahasiswaID INT,
    KelasID INT,
    Nilai DECIMAL(5,2),
    FOREIGN KEY (MahasiswaID) REFERENCES Mahasiswa(MahasiswaID),
    FOREIGN KEY (KelasID) REFERENCES Kelas(KelasID)
);

INSERT INTO Mahasiswa (MahasiswaID, Nama, Alamat, TanggalLahir, NoHP) VALUES
(1, 'Lionel Jevon', 'Surabaya', '2006-02-12', '081234567890'),
(2, 'Fadhil Nur Hafiz', 'Malang', '2006-05-22', '082345678901'),
(3, 'Andriko Tomansyah', 'Sidoarjo', '2001-03-10', '083456789012'),
(4, 'Deni Kurniawan', 'Gresik', '2006-07-25', '084567890123'),
(5, 'Eka Putri', 'Lamongan', '2007-09-18', '085678901234');

INSERT INTO Dosen (DosenID, Nama, Email, NoHP) VALUES
(10, 'Dr. Rina Widya', 'rina.widya@univ.ac.id', '081122334455'),
(11, 'Dr. Yusuf Malik', 'yusuf.malik@univ.ac.id', '082233445566'),
(12, 'Dr. Sinta Dewi', 'sinta.dewi@univ.ac.id', '083344556677'),
(13, 'Dr. Arif Hidayat', 'arif.hidayat@univ.ac.id', '084455667788'),
(14, 'Dr. Lestari Nur', 'lestari.nur@univ.ac.id', '085566778899');

INSERT INTO MataKuliah (MataKuliahID, NamaMK, SKS, Semester) VALUES
(100, 'Basis Data', 3, 4),
(101, 'Algoritma dan Pemrograman', 3, 2),
(102, 'Matematika Diskrit', 2, 2),
(103, 'Sistem Operasi', 3, 3),
(104, 'Jaringan Komputer', 2, 4);

INSERT INTO Kelas (KelasID, MataKuliahID, DosenID, TahunAkademik) VALUES
(201, 100, 10, '2024/2025'),
(202, 101, 11, '2024/2025'),
(203, 102, 12, '2024/2025'),
(204, 103, 13, '2024/2025'),
(205, 104, 14, '2024/2025');

INSERT INTO Nilai (NilaiID, MahasiswaID, KelasID, Nilai) VALUES
(301, 1, 201, 85.5),
(302, 2, 202, 90.0),
(303, 3, 203, 78.0),
(304, 4, 204, 88.0),
(305, 5, 205, 92.5);

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

SELECT * FROM Mahasiswa;

SELECT Nama, Nilai
FROM Mahasiswa
JOIN Nilai ON Mahasiswa.MahasiswaID = Nilai.MahasiswaID;

SELECT MataKuliah.NamaMK, Dosen.Nama
FROM Kelas
JOIN MataKuliah ON Kelas.MataKuliahID = MataKuliah.MataKuliahID
JOIN Dosen ON Kelas.DosenID = Dosen.DosenID;

UPDATE Mahasiswa
SET Alamat = 'Sidoarjo'
WHERE MahasiswaID = 2;

UPDATE Mahasiswa
SET Alamat = 'Jakarta'
WHERE MahasiswaID = 1;

UPDATE MataKuliah
SET SKS = 4
WHERE MataKuliahID = 100;

UPDATE Nilai
SET Nilai = 95.0
WHERE NilaiID = 301;

DELETE FROM Mahasiswa
WHERE MahasiswaID = 2;

DELETE FROM Nilai
WHERE NilaiID = 302;

DELETE FROM Mahasiswa
WHERE MahasiswaID = 5;