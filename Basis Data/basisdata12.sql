CREATE DATABASE list_barang

USE list_barang;

CREATE TABLE Jenis_Barang (
    Jenis_brg VARCHAR(50) PRIMARY KEY
);

INSERT INTO Jenis_Barang (Jenis_brg) VALUES
('Furniture'),
('ATK'),
('Jaringan');

CREATE TABLE Barang (
    kode_brg VARCHAR(10) PRIMARY KEY,
    nama_brg VARCHAR(50),
    Jenis_brg VARCHAR(50),
    FOREIGN KEY (Jenis_brg) REFERENCES Jenis_Barang(Jenis_brg)
);

INSERT INTO Barang (kode_brg, nama_brg, Jenis_brg) VALUES
('BRG_01', 'Meja', 'Furniture'),
('BRG_02', 'Kursi', 'Furniture'),
('BRG_03', 'Meja Kecil', 'Furniture'),
('BRG_04', 'Bolpoin', 'ATK'),
('BRG_05', 'HVS A4', 'ATK'),
('BRG_06', 'Paper Clip', 'ATK'),
('BRG_07', 'Router', 'Jaringan'),
('BRG_08', 'LAN', 'Jaringan'),
('BRG_09', 'RJ45', 'Jaringan');

CREATE TABLE Detail_Barang (
    jenis_brg VARCHAR(50),
    kode_brg VARCHAR(10),
    qty_brg INT,
    tgl_input_brg DATE,
    desc_brg VARCHAR(100),
    FOREIGN KEY (jenis_brg) REFERENCES Jenis_Barang(Jenis_brg),
    FOREIGN KEY (kode_brg) REFERENCES Barang(kode_brg)
);

INSERT INTO Detail_Barang (jenis_brg, kode_brg, qty_brg, tgl_input_brg, desc_brg) VALUES
('Furniture', 'BRG_01', 40, '2022-04-20', 'Meja Gedung 1'),
('Furniture', 'BRG_02', 80, '2022-04-20', 'Kursi gedung 1'),
('Furniture', 'BRG_03', 12, '2022-04-22', 'Meja Ruangan'),
('ATK', 'BRG_04', 200, '2022-07-04', 'Alat Tulis Gedung 1'),
('ATK', 'BRG_05', 14, '2022-07-04', 'Alat Tulis Gedung 1'),
('ATK', 'BRG_06', 1000, '2022-07-04', 'Alat Tulis Gedung 1'),
('Jaringan', 'BRG_07', 1, '2022-07-10', 'Alat Jaringan Gdg 1'),
('Jaringan', 'BRG_08', 2, '2022-07-11', 'Alat Jaringan Gdg 1'),
('Jaringan', 'BRG_09', 10, '2022-07-11', 'Alat Jaringan Gdg 1');

SELECT
    db.kode_brg,
    b.nama_brg,
    db.jenis_brg,
    db.qty_brg,
    db.tgl_input_brg,
    db.desc_brg
FROM
    Detail_Barang db
JOIN
    Barang b ON db.kode_brg = b.kode_brg
JOIN
    Jenis_Barang jb ON db.jenis_brg = jb.Jenis_brg;