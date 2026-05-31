/*==============================================================*/
/* DBMS name:      SAP SQL Anywhere 17                          */
/* Created on:     5/26/2026 1:11:07 PM                         */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_KELAS_MENGAMPU_MATAKULI') then
    alter table KELAS
       delete foreign key FK_KELAS_MENGAMPU_MATAKULI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MENGAJAR_MENGAJAR_KELAS') then
    alter table MENGAJAR
       delete foreign key FK_MENGAJAR_MENGAJAR_KELAS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MENGAJAR_MENGAJAR2_DOSEN') then
    alter table MENGAJAR
       delete foreign key FK_MENGAJAR_MENGAJAR2_DOSEN
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MENGHASI_MENGHASIL_NILAI') then
    alter table MENGHASILKAN
       delete foreign key FK_MENGHASI_MENGHASIL_NILAI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MENGHASI_MENGHASIL_KELAS') then
    alter table MENGHASILKAN
       delete foreign key FK_MENGHASI_MENGHASIL_KELAS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_NILAI_MEMILIKI_MAHASISW') then
    alter table NILAI
       delete foreign key FK_NILAI_MEMILIKI_MAHASISW
end if;

drop index if exists DOSEN.DOSEN_PK;

drop table if exists DOSEN;

drop index if exists KELAS.MENGAMPU_FK;

drop index if exists KELAS.KELAS_PK;

drop table if exists KELAS;

drop index if exists MAHASISWA.MAHASISWA_PK;

drop table if exists MAHASISWA;

drop index if exists MATAKULIAH.MATAKULIAH_PK;

drop table if exists MATAKULIAH;

drop index if exists MENGAJAR.MENGAJAR_FK;

drop index if exists MENGAJAR.MENGAJAR2_FK;

drop index if exists MENGAJAR.MENGAJAR_PK;

drop table if exists MENGAJAR;

drop index if exists MENGHASILKAN.MENGHASILKAN_FK;

drop index if exists MENGHASILKAN.MENGHASILKAN2_FK;

drop index if exists MENGHASILKAN.MENGHASILKAN_PK;

drop table if exists MENGHASILKAN;

drop index if exists NILAI.MEMILIKI_FK;

drop index if exists NILAI.NILAI_PK;

drop table if exists NILAI;

/*==============================================================*/
/* Table: DOSEN                                                 */
/*==============================================================*/
create or replace table DOSEN 
(
   DOSENID              integer                        not null,
   NAMADOSEN            varchar(100)                   not null,
   EMAIL                varchar(100)                   not null,
   NOHPDOSEN            varchar(15)                    not null,
   constraint PK_DOSEN primary key clustered (DOSENID)
);

/*==============================================================*/
/* Index: DOSEN_PK                                              */
/*==============================================================*/
create unique clustered index DOSEN_PK on DOSEN (
DOSENID ASC
);

/*==============================================================*/
/* Table: KELAS                                                 */
/*==============================================================*/
create or replace table KELAS 
(
   KELASID              integer                        not null,
   MATAKULIAHID         integer                        null,
   TAHUNAKADEMIK        integer                        not null,
   constraint PK_KELAS primary key clustered (KELASID)
);

/*==============================================================*/
/* Index: KELAS_PK                                              */
/*==============================================================*/
create unique clustered index KELAS_PK on KELAS (
KELASID ASC
);

/*==============================================================*/
/* Index: MENGAMPU_FK                                           */
/*==============================================================*/
create index MENGAMPU_FK on KELAS (
MATAKULIAHID ASC
);

/*==============================================================*/
/* Table: MAHASISWA                                             */
/*==============================================================*/
create or replace table MAHASISWA 
(
   MAHASISWAID          integer                        not null,
   NAMA                 varchar(100)                   not null,
   ALAMAT               varchar(200)                   not null,
   TANGGALLAHIR         date                           not null,
   NOHP                 varchar(15)                    not null,
   constraint PK_MAHASISWA primary key clustered (MAHASISWAID)
);

/*==============================================================*/
/* Index: MAHASISWA_PK                                          */
/*==============================================================*/
create unique clustered index MAHASISWA_PK on MAHASISWA (
MAHASISWAID ASC
);

/*==============================================================*/
/* Table: MATAKULIAH                                            */
/*==============================================================*/
create or replace table MATAKULIAH 
(
   MATAKULIAHID         integer                        not null,
   NAMAMK               varchar(100)                   not null,
   SKS                  integer                        not null,
   SEMESTER             integer                        null,
   constraint PK_MATAKULIAH primary key clustered (MATAKULIAHID)
);

/*==============================================================*/
/* Index: MATAKULIAH_PK                                         */
/*==============================================================*/
create unique clustered index MATAKULIAH_PK on MATAKULIAH (
MATAKULIAHID ASC
);

/*==============================================================*/
/* Table: MENGAJAR                                              */
/*==============================================================*/
create or replace table MENGAJAR 
(
   KELASID              integer                        not null,
   DOSENID              integer                        not null,
   constraint PK_MENGAJAR primary key clustered (KELASID, DOSENID)
);

/*==============================================================*/
/* Index: MENGAJAR_PK                                           */
/*==============================================================*/
create unique clustered index MENGAJAR_PK on MENGAJAR (
KELASID ASC,
DOSENID ASC
);

/*==============================================================*/
/* Index: MENGAJAR2_FK                                          */
/*==============================================================*/
create index MENGAJAR2_FK on MENGAJAR (
DOSENID ASC
);

/*==============================================================*/
/* Index: MENGAJAR_FK                                           */
/*==============================================================*/
create index MENGAJAR_FK on MENGAJAR (
KELASID ASC
);

/*==============================================================*/
/* Table: MENGHASILKAN                                          */
/*==============================================================*/
create or replace table MENGHASILKAN 
(
   NILAIID              integer                        not null,
   KELASID              integer                        not null,
   constraint PK_MENGHASILKAN primary key clustered (NILAIID, KELASID)
);

/*==============================================================*/
/* Index: MENGHASILKAN_PK                                       */
/*==============================================================*/
create unique clustered index MENGHASILKAN_PK on MENGHASILKAN (
NILAIID ASC,
KELASID ASC
);

/*==============================================================*/
/* Index: MENGHASILKAN2_FK                                      */
/*==============================================================*/
create index MENGHASILKAN2_FK on MENGHASILKAN (
KELASID ASC
);

/*==============================================================*/
/* Index: MENGHASILKAN_FK                                       */
/*==============================================================*/
create index MENGHASILKAN_FK on MENGHASILKAN (
NILAIID ASC
);

/*==============================================================*/
/* Table: NILAI                                                 */
/*==============================================================*/
create or replace table NILAI 
(
   NILAIID              integer                        not null,
   MAHASISWAID          integer                        null,
   NILAI                decimal(5,2)                   not null,
   constraint PK_NILAI primary key clustered (NILAIID)
);

/*==============================================================*/
/* Index: NILAI_PK                                              */
/*==============================================================*/
create unique clustered index NILAI_PK on NILAI (
NILAIID ASC
);

/*==============================================================*/
/* Index: MEMILIKI_FK                                           */
/*==============================================================*/
create index MEMILIKI_FK on NILAI (
MAHASISWAID ASC
);

alter table KELAS
   add constraint FK_KELAS_MENGAMPU_MATAKULI foreign key (MATAKULIAHID)
      references MATAKULIAH (MATAKULIAHID)
      on update restrict
      on delete restrict;

alter table MENGAJAR
   add constraint FK_MENGAJAR_MENGAJAR_KELAS foreign key (KELASID)
      references KELAS (KELASID)
      on update restrict
      on delete restrict;

alter table MENGAJAR
   add constraint FK_MENGAJAR_MENGAJAR2_DOSEN foreign key (DOSENID)
      references DOSEN (DOSENID)
      on update restrict
      on delete restrict;

alter table MENGHASILKAN
   add constraint FK_MENGHASI_MENGHASIL_NILAI foreign key (NILAIID)
      references NILAI (NILAIID)
      on update restrict
      on delete restrict;

alter table MENGHASILKAN
   add constraint FK_MENGHASI_MENGHASIL_KELAS foreign key (KELASID)
      references KELAS (KELASID)
      on update restrict
      on delete restrict;

alter table NILAI
   add constraint FK_NILAI_MEMILIKI_MAHASISW foreign key (MAHASISWAID)
      references MAHASISWA (MAHASISWAID)
      on update restrict
      on delete restrict;

