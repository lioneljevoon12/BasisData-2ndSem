-- Menghapus satu baris berdasarkan ID
DELETE FROM NamaTabel WHERE PrimaryKey = nilai_pk;
-- Menghapus berdasarkan kondisi tertentu
DELETE FROM Nilai WHERE NilaiID = 302;
-- PERINGATAN: Perintah berikut akan menghapus SEMUA data!
-- DELETE FROM NamaTabel; <-- JANGAN dieksekusi tanpa WHERE