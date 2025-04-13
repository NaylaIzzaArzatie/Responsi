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
