CREATE DATABASE Manajemen_Perpustakaan

USE Manajemen_Perpustakaan;

CREATE TABLE Mahasiswa (
    NIM VARCHAR(10) PRIMARY KEY,
    Nama_Mhs VARCHAR(50) NOT NULL,
    Prodi VARCHAR(50) NOT NULL
);

CREATE TABLE Buku (
    Kode_Buku VARCHAR(10) PRIMARY KEY,
    Judul_Buku VARCHAR(100) NOT NULL,
    Penulis VARCHAR(50) NOT NULL
);

CREATE TABLE Peminjaman (
    Kode_Pinjam VARCHAR(10) PRIMARY KEY,
    Tgl_Pinjam DATE NOT NULL,
    Tgl_Kembali DATE NOT NULL,
    NIM VARCHAR(10),
    Kode_Buku VARCHAR(10),
    FOREIGN KEY (NIM) REFERENCES Mahasiswa(NIM),
    FOREIGN KEY (Kode_Buku) REFERENCES Buku(Kode_Buku)
);

INSERT INTO Mahasiswa VALUES ('20230101', 'Andi R', 'Informatika');
INSERT INTO Mahasiswa VALUES ('20230102', 'Rina Lestari', 'SI');

INSERT INTO Buku VALUES ('BK01', 'Alpro', 'Rudi H');
INSERT INTO Buku VALUES ('BK02', 'Basdat', 'Tono W');

INSERT INTO Peminjaman VALUES ('P001', '2025-03-01', '2025-03-10', '20230101', 'BK01');
INSERT INTO Peminjaman VALUES ('P002', '2025-03-02', '2025-03-09', '20230101', 'BK02');
INSERT INTO Peminjaman VALUES ('P003', '2025-03-02', '2025-03-12', '20230102', 'BK01')

SELECT * FROM Mahasiswa;

SELECT * FROM Buku;

SELECT * FROM Peminjaman;

SELECT 
    p.Kode_Pinjam,
    p.Tgl_Pinjam,
    p.Tgl_Kembali,
    m.NIM,
    m.Nama_Mhs,
    m.Prodi,
    b.Kode_Buku,
    b.Judul_Buku,
    b.Penulis
FROM Peminjaman p
JOIN Mahasiswa m ON p.NIM = m.NIM
JOIN Buku b ON p.Kode_Buku = b.Kode_Buku
ORDER BY p.Kode_Pinjam;