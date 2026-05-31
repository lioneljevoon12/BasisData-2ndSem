/*==============================================================*/
/* DBMS name:      MySQL / MariaDB                              */
/* Converted from: SAP SQL Anywhere 17                         */
/* Created on:     5/26/2026                                    */
/*==============================================================*/

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS NILAI;
DROP TABLE IF EXISTS KELAS;
DROP TABLE IF EXISTS MAHASISWA;
DROP TABLE IF EXISTS MATAKULIAH;
DROP TABLE IF EXISTS DOSEN;

SET FOREIGN_KEY_CHECKS = 1;

/*==============================================================*/
/* Table: DOSEN                                                 */
/*==============================================================*/
CREATE TABLE DOSEN (
    DOSENID     INT             NOT NULL,
    NAMADOSEN   VARCHAR(100)    NOT NULL,
    EMAIL       VARCHAR(100)    NOT NULL,
    NOHPDOSEN   VARCHAR(15)     NOT NULL,
    CONSTRAINT PK_DOSEN PRIMARY KEY (DOSENID)
);

/*==============================================================*/
/* Table: MATAKULIAH                                            */
/*==============================================================*/
CREATE TABLE MATAKULIAH (
    MATAKULIAHID    INT             NOT NULL,
    NAMAMK          VARCHAR(100)    NOT NULL,
    SKS             INT             NOT NULL,
    SEMESTER        INT             NULL,
    CONSTRAINT PK_MATAKULIAH PRIMARY KEY (MATAKULIAHID)
);

/*==============================================================*/
/* Table: KELAS                                                 */
/*==============================================================*/
CREATE TABLE KELAS (
    KELASID         INT     NOT NULL,
    MATAKULIAHID    INT     NULL,
    TAHUNAKADEMIK   INT     NOT NULL,
    CONSTRAINT PK_KELAS PRIMARY KEY (KELASID),
    CONSTRAINT FK_KELAS_MENGAMPU_MATAKULI FOREIGN KEY (MATAKULIAHID)
        REFERENCES MATAKULIAH (MATAKULIAHID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

/*==============================================================*/
/* Table: MAHASISWA                                             */
/*==============================================================*/
CREATE TABLE MAHASISWA (
    MAHASISWAID     INT             NOT NULL,
    NAMA            VARCHAR(100)    NOT NULL,
    ALAMAT          VARCHAR(200)    NOT NULL,
    TANGGALLAHIR    DATE            NOT NULL,
    NOHP            VARCHAR(15)     NOT NULL,
    CONSTRAINT PK_MAHASISWA PRIMARY KEY (MAHASISWAID)
);

/*==============================================================*/
/* Table: NILAI                                                 */
/*==============================================================*/
CREATE TABLE NILAI (
    NILAIID         INT             NOT NULL,
    MAHASISWAID     INT             NULL,
    NILAI           DECIMAL(5,2)    NOT NULL,
    CONSTRAINT PK_NILAI PRIMARY KEY (NILAIID),
    CONSTRAINT FK_NILAI_MEMILIKI_MAHASISW FOREIGN KEY (MAHASISWAID)
        REFERENCES MAHASISWA (MAHASISWAID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);