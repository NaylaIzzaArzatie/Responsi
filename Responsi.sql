Microsoft Windows [Version 10.0.26100.3194]
(c) Microsoft Corporation. All rights reserved.

C:\Users\LENOVO>CD C:\xampp\mysql\bin

C:\xampp\mysql\bin>mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 29
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> CREATE DATABASE 052RESPONSI;
Query OK, 1 row affected (0.002 sec)

MariaDB [(none)]> USE 052RESPONSI;
Database changed
MariaDB [052RESPONSI]> CREATE TABLE Anggota (
    -> Id_Anggota VARCHAT(10) PRIMARY KEY,
    -> Nama VARCHAR(50) NOT NULL,
    -> Jurusan VARCHAR(20) DEFAULT 'Umum',
    -> Tgl_daftar DATE NOT NULL
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(10) PRIMARY KEY,
Nama VARCHAR(50) NOT NULL,
Jurusan VARCHAR(20) DEFAULT 'Umu...' at line 2
MariaDB [052RESPONSI]> CREATE TABLE Anggota (
    -> Id_Anggota VARCHAR(10) PRIMARY KEY,
    -> Nama VARCHAR(50) NOT NULL,
    -> Jurusan VARCHAR(20) DEFAULT 'Umum',
    -> Tgl_Daftar DATE NOT NULL
    -> );
Query OK, 0 rows affected (0.025 sec)

MariaDB [052RESPONSI]> SELECT * FROM Anggota;
Empty set (0.007 sec)

MariaDB [052RESPONSI]> INSERT INTO Anggota (Id_Anggota, Nama, Jurusan, Tgl_Daftar) VALUES
    -> ('D001', 'Nayla', 'Teknologi Informasi', '2024-09-16'),
    -> ('D002', 'Brilliant', 'Teknik Elekto', '2024-09-23'),
    -> ('D003', 'Alvita', 'Teknik Mekatronika', '2024-10-07');
Query OK, 3 rows affected (0.013 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [052RESPONSI]> SELECT * FROM Anggota;
+------------+-----------+---------------------+------------+
| Id_Anggota | Nama      | Jurusan             | Tgl_Daftar |
+------------+-----------+---------------------+------------+
| D001       | Nayla     | Teknologi Informasi | 2024-09-16 |
| D002       | Brilliant | Teknik Elekto       | 2024-09-23 |
| D003       | Alvita    | Teknik Mekatronika  | 2024-10-07 |
+------------+-----------+---------------------+------------+
3 rows in set (0.001 sec)

MariaDB [052RESPONSI]> CREATE TABLE Buku (
    -> Id_Buku VARCHAR(10) PRIMARY KEY,
    -> Judul VARCHAR(100) NOT NULL,
    -> Penerbit VARCHAR(50),
    -> Tahun_Terbit INT CHECK (Tahun_Terbit BETWEEN 1900 AND 2025)
    -> );
Query OK, 0 rows affected (0.022 sec)

MariaDB [052RESPONSI]> INSERT INTO Buku (Id_Buku, Judul, Penerbit, Tahun_Terbit) VALUES
    -> ('N001', 'Dasar Teknik Digital', 'Deepublish', 2018),
    -> ('N002', 'Basis Data', 'Media Sains Indonesia', 2022),
    -> ('N003', 'Mekatronika', 'Gadjah Mada University Press', 2021),
    -> ('N004', 'Pemrograman Web', 'Informatika', 2021),
    -> ('N004', 'Rangkaian Digital', 'Graha Ilmu', 2019);
ERROR 1062 (23000): Duplicate entry 'N004' for key 'PRIMARY'
MariaDB [052RESPONSI]> INSERT INTO Buku (Id_Buku, Judul, Penerbit, Tahun_Terbit) VALUES
    -> ('N001', 'Dasar Teknik Digital', 'Deepublish', 2018),
    -> ('N002', 'Basis Data', 'Media Sains Indonesia', 2022),
    -> ('N003', 'Mekatronika', 'Gadjah Mada University Press', 2021),
    -> ('N004', 'Pemrograman Web', 'Informatika', 2021),
    -> ('N005', 'Rangkaian Digital', 'Graha Ilmu', 2019);
Query OK, 5 rows affected (0.013 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [052RESPONSI]> SELECT * FROM Buku;
+---------+----------------------+------------------------------+--------------+
| Id_Buku | Judul                | Penerbit                     | Tahun_Terbit |
+---------+----------------------+------------------------------+--------------+
| N001    | Dasar Teknik Digital | Deepublish                   |         2018 |
| N002    | Basis Data           | Media Sains Indonesia        |         2022 |
| N003    | Mekatronika          | Gadjah Mada University Press |         2021 |
| N004    | Pemrograman Web      | Informatika                  |         2021 |
| N005    | Rangkaian Digital    | Graha Ilmu                   |         2019 |
+---------+----------------------+------------------------------+--------------+
5 rows in set (0.001 sec)

MariaDB [052RESPONSI]> CREATE TABLE Peminjaman (
    -> Id_Peminjaman INT PRIMARY KEY AUTO_INCREMENT,
    -> Id_Anggota VARCHAR(10),
    -> Id_Buku VARCHAR(10),
    -> Tgl_Pinjam DATE NOT NULL,
    -> Tgl_Kembali DATE,
    -> Denda INT DEFAULT 0,
    -> FOREIGN KEY (Id_Anggota) REFERENCES Anggota(Id_Anggota),
    -> FOREIGN KEY (Id_Buku) REFERENCES Buku(Id_Buku)
    -> );
Query OK, 0 rows affected (0.056 sec)

MariaDB [052RESPONSI]> INSERT INTO Peminjaman (Id_Anggota, Id_Buku, Tgl_Pinjam, Tgl_Kembali, Denda) VALUES
    -> ('D001', 'N002', '2025-02-02', '2025-02-02', 0),
    -> ('D002', 'N005', '2025-02-16', '2025-02-23', 3000),
    -> ('D003', 'N003', '2025-02-23', NULL, 0);
Query OK, 3 rows affected (0.005 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [052RESPONSI]> SELECT * FROM Peminjaman;
+---------------+------------+---------+------------+-------------+-------+
| Id_Peminjaman | Id_Anggota | Id_Buku | Tgl_Pinjam | Tgl_Kembali | Denda |
+---------------+------------+---------+------------+-------------+-------+
|             1 | D001       | N002    | 2025-02-02 | 2025-02-02  |     0 |
|             2 | D002       | N005    | 2025-02-16 | 2025-02-23  |  3000 |
|             3 | D003       | N003    | 2025-02-23 | NULL        |     0 |
+---------------+------------+---------+------------+-------------+-------+
3 rows in set (0.001 sec)

MariaDB [052RESPONSI]> UPDATE Peminjaman SET Denda = 3000 * 5 WHERE Id_Peminjaman = 2 AND Tgl_Kembali > '2025-02-18';
Query OK, 1 row affected (0.013 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [052RESPONSI]> SELECT * FROM Peminjaman;
+---------------+------------+---------+------------+-------------+-------+
| Id_Peminjaman | Id_Anggota | Id_Buku | Tgl_Pinjam | Tgl_Kembali | Denda |
+---------------+------------+---------+------------+-------------+-------+
|             1 | D001       | N002    | 2025-02-02 | 2025-02-02  |     0 |
|             2 | D002       | N005    | 2025-02-16 | 2025-02-23  | 15000 |
|             3 | D003       | N003    | 2025-02-23 | NULL        |     0 |
+---------------+------------+---------+------------+-------------+-------+
3 rows in set (0.001 sec)

MariaDB [052RESPONSI]> SELECT a.Nama, COUNT(p.Id_Buku) AS Jumlah_Buku_Dipinjam
    -> FROM Anggota a
    -> JOIN Peminjaman p ON a.Id_Anggota = p.Id_Anggota
    -> GROUP BY a.Nama;
+-----------+----------------------+
| Nama      | Jumlah_Buku_Dipinjam |
+-----------+----------------------+
| Alvita    |                    1 |
| Brilliant |                    1 |
| Nayla     |                    1 |
+-----------+----------------------+
3 rows in set (0.001 sec)

MariaDB [052RESPONSI]> SELECT AVG(DATEDIFF(Tgl_Kembali, Tgl_Pinjam)) AS Rata_Rata_Hari
    -> FROM Peminjaman
    -> WHERE Tgl_Kembali IS NOT NULL;
+----------------+
| Rata_Rata_Hari |
+----------------+
|         3.5000 |
+----------------+
1 row in set (0.001 sec)

MariaDB [052RESPONSI]> Select b.Judul, COUNT(p.Id_Buku) AS Jumlah_Peminjaman
    -> FROM Buku b
    -> JOIN Peminjaman p ON b.Id_Buku = p.Id_Buku
    -> GROUP BY b.Judul
    -> ORDER BY Jumlah_Peminjaman DESC
    -> LIMIT 1;
+-------------+-------------------+
| Judul       | Jumlah_Peminjaman |
+-------------+-------------------+
| Mekatronika |                 1 |
+-------------+-------------------+
1 row in set (0.001 sec)

MariaDB [052RESPONSI]> CREATE TABLE Penerbit (
    -> Id_Penerbit VARCHAR(10) PRIMARY KEY,
    -> Nama_Penerbit VARCHAR(50) NOT NULL,
    -> Alamat TEXT
    -> );
Query OK, 0 rows affected (0.023 sec)

MariaDB [052RESPONSI]> ALTER TABLE Buku ADD COLUMN Id_Penerbit VARCHAR(10);
Query OK, 0 rows affected (0.020 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [052RESPONSI]> ALTER TABLE Buku ADD FOREIGN KEY (Id_Penerbit) REFERENCES Penerbit(Id_Penerbit);
Query OK, 5 rows affected (0.075 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [052RESPONSI]> SELECT DISTINCT a.Nama
    -> FROM Anggota a
    -> JOIN Peminjaman p ON a.Id_Anggota = p.Id_Anggota
    -> JOIN Buku b ON p.Id_Buku = b.Id_Buku
    -> WHERE b.Judul = 'Basis Data';
+-------+
| Nama  |
+-------+
| Nayla |
+-------+
1 row in set (0.010 sec)

MariaDB [052RESPONSI]> SELECT Judul FROM Buku WHERE Id_Buku NOT IN (
    -> SELECT Id_Buku FTOM Peminjaman
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Peminjaman
)' at line 2
MariaDB [052RESPONSI]> SELECT Judul FROM Buku WHERE Id_Buku NOT IN (
    -> SELECT Id_Buku FROM Peminjaman
    -> );
+----------------------+
| Judul                |
+----------------------+
| Dasar Teknik Digital |
| Pemrograman Web      |
+----------------------+
2 rows in set (0.001 sec)

MariaDB [052RESPONSI]> UPDATE Peminjaman SET Denda = 0 WHERE Id_Peminjaman IN (
    -> SELECT Id_Peminjaman
    -> FROM Id_Peminjaman
    -> WHERE Tgl_Kembali <= Tgl_Jatuh_Tempo
    -> );
ERROR 1146 (42S02): Table '052responsi.id_peminjaman' doesn't exist
MariaDB [052RESPONSI]> UPDATE Peminjaman SET Denda = 0 WHERE Tgl_Kembali <= DATE_ADD(Tgl_Pinjam, INTERVAL 7 DAY);
Query OK, 1 row affected (0.003 sec)
Rows matched: 2  Changed: 1  Warnings: 0

MariaDB [052RESPONSI]> SELECT * FROM Peminjaman;
+---------------+------------+---------+------------+-------------+-------+
| Id_Peminjaman | Id_Anggota | Id_Buku | Tgl_Pinjam | Tgl_Kembali | Denda |
+---------------+------------+---------+------------+-------------+-------+
|             1 | D001       | N002    | 2025-02-02 | 2025-02-02  |     0 |
|             2 | D002       | N005    | 2025-02-16 | 2025-02-23  |     0 |
|             3 | D003       | N003    | 2025-02-23 | NULL        |     0 |
+---------------+------------+---------+------------+-------------+-------+
3 rows in set (0.001 sec)

MariaDB [052RESPONSI]> INSERT INTO Penerbit (Id_Penerbit, Nama_Penerbit, Alamat) VALUES
    -> ('P001', 'Deepublish', 'Jakarta'),
    -> ('P002', 'Media Sains Indonesia', 'Bandung'),
    -> ('P003', 'Gadjah Mada University Press', 'Yogyakarta'),
    -> ('P004', 'Informatika', 'Bandung'),
    -> ('P005', 'Graha Ilmu', 'Yogyakarta');
Query OK, 5 rows affected (0.006 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [052RESPONSI]> SELECT * FROM Penerbit;
+-------------+------------------------------+------------+
| Id_Penerbit | Nama_Penerbit                | Alamat     |
+-------------+------------------------------+------------+
| P001        | Deepublish                   | Jakarta    |
| P002        | Media Sains Indonesia        | Bandung    |
| P003        | Gadjah Mada University Press | Yogyakarta |
| P004        | Informatika                  | Bandung    |
| P005        | Graha Ilmu                   | Yogyakarta |
+-------------+------------------------------+------------+
5 rows in set (0.001 sec)

MariaDB [052RESPONSI]> UPDATE Buku SET Id_Penerbit = 'P001' WHERE Id_Buku = 'N001';
Query OK, 1 row affected (0.007 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [052RESPONSI]> UPDATE Buku SET Id_Penerbit = 'P002' WHERE Id_Buku = 'N002';
Query OK, 1 row affected (0.012 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [052RESPONSI]> UPDATE Buku SET Id_Penerbit = 'P003' WHERE Id_Buku = 'N003';
Query OK, 1 row affected (0.013 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [052RESPONSI]> UPDATE Buku SET Id_Penerbit = 'P004' WHERE Id_Buku = 'N004';
Query OK, 1 row affected (0.013 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [052RESPONSI]> UPDATE Buku SET Id_Penerbit = 'P005' WHERE Id_Buku = 'N005';
Query OK, 1 row affected (0.013 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [052RESPONSI]> SELECT Buku.Id_Buku, Buku.Judul, Penerbit.Nama_Penerbit
    -> FROM Buku
    -> INNER JOIN Penerbit ON Buku.Id_Penerbit = Penerbit.Id_Penerbit;
+---------+----------------------+------------------------------+
| Id_Buku | Judul                | Nama_Penerbit                |
+---------+----------------------+------------------------------+
| N001    | Dasar Teknik Digital | Deepublish                   |
| N002    | Basis Data           | Media Sains Indonesia        |
| N003    | Mekatronika          | Gadjah Mada University Press |
| N004    | Pemrograman Web      | Informatika                  |
| N005    | Rangkaian Digital    | Graha Ilmu                   |
+---------+----------------------+------------------------------+
5 rows in set (0.001 sec)

MariaDB [052RESPONSI]> SELECT
    -> t.Id_Peminjaman,
    -> a.Id_Anggota,
    -> b.Judul,
    -> p.Id_Penerbit,
    -> t.Tgl_Pinjam,
    -> t.Tgl_Kembali,
    -> t.Denda
    -> FROM Peminjaman t
    -> JOIN Anggota a ON t.Id_Anggota = a.Id_Anggota
    -> JOIN Buku b ON t.Id_Buku = b.Id_Buku
    -> JOIN Penerbit p ON b.Id_Penerbit = p.Id_Penerbit;
+---------------+------------+-------------------+-------------+------------+-------------+-------+
| Id_Peminjaman | Id_Anggota | Judul             | Id_Penerbit | Tgl_Pinjam | Tgl_Kembali | Denda |
+---------------+------------+-------------------+-------------+------------+-------------+-------+
|             1 | D001       | Basis Data        | P002        | 2025-02-02 | 2025-02-02  |     0 |
|             2 | D002       | Rangkaian Digital | P005        | 2025-02-16 | 2025-02-23  |     0 |
|             3 | D003       | Mekatronika       | P003        | 2025-02-23 | NULL        |     0 |
+---------------+------------+-------------------+-------------+------------+-------------+-------+
3 rows in set (0.001 sec)

MariaDB [052RESPONSI]> exit
Bye
