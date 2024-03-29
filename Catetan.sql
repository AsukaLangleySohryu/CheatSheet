CREATE DATABASE
 -> CREATE DATABASE (Nama database)

 DROP DATABASE
 HAPUS DATABASE
 -> DROP DATABASE (Nama Database)


  I. PRIMARY KEY 

	UNIQUE KEY YANG MEWAKILI ATRIBUT
	-> MahasiswaID CHAR(5) PRIMARY KEY CHECK(MahasiswaID REGEXP 'MS[0-9][0-9][0-9]')
	// KETIK (PRIMARY KEY) ABIS DATA TYPE
	

  II. CONSTRAINT
	
	MEMBERIKAN RULES SEBUAH TABLE KE DATABASE
	
	-> MahasiswaID  CHAR(5) PRIMARY KEY CHECK(MahasiswaID REGEXP 'MS[0-9][0-9][0-9]')
	// (Nama Atribut yang mau dibuat) (DATA TYPE) CHECK(Nama Atributnya REGEXP 'CONSTRAINT YANG DIMAU')

	
  REGEXP 

  BUAT NGERETURN APAKAH SESUATU YANG DICARI KETEMU ATAU TIDAK

  ^ -> STARTS WITH
  $ -> END WITH

  CONTOH : MAU CONSTRAINTNYA BERAKHIRAN DENGAN STREET
	-> REGEXP ' Street$'

  III. FOREIGN KEY
	
	KEY UNTUK MENGHUBUNGKAN CHILD TABLE DENGAN PARENT TABLE

	-> CREATE TABLE Weapon( 
	   WeaponID int PRIMARY KEY, 
	   WeaponName varchar(255), 
	   WeaponTypeID int, 
	   FOREIGN KEY (WeaponTypeID) 
	   REFERENCES weapontype(WeaponTypeID) ON UPDATE CASCADE ON DELETE CASCADE )

	// UNTUK MEMBUAT FOREIGN KEY, HARUS MASUKIN PRIMARY KEY DARI PARENT TABLENYA CONTOH DISINI YAITU WeaponTypeID
	   QUERYNYA :
	   CREATE TABLE (NAMA TABLE CHILD) (
	  	 (PRIMARY KEY DARI TABLE PARENT) (DATA TYPE),
	  	 FOREIGN KEY (PRIMARY KEY PARENT(HARUS PAKE KURUNG))
	 	 REFERENCES (TABLE PARENT)(PRIMARY KEY PARENT(HARUS PAKE KURUNG)) ON UPDATE CASCADE ON DELETE CASCADE
	   )


  IV. JOIN
	
	GABUNGIN 2 ATAU LEBIH TABEL SUPAYA BISA DIAKSES

	-> SELECT th.TransactionId, th.Staffid, mc.CustomerName 
	   FROM transactionheader th JOIN mscustomer mc on th.CustomerId = mc.CustomerId

	// MISAL MAU GABUNGIN 2 ATRIBUT -- ATRIBUT A DAN ATRIBUT B

	   SELECT (ATRIBUT YANG MAU DITAMPILIN)
	   FROM (NAMA ATRIBUT A) (ALIAS ATRIBUT A) JOIN (NAMA ATRIBUT B) (ALIAS ATRIBUT B)
	   ON ALIAS A.PRIMARY KEY ALIAS B = ALIAS B.PRIMARY KEY ALIAS B
	
	

A. CREATE 

-> CREATE TABLE mahasiswa(

    	//Nama Variable di depan, Tipe Data

   	ID INT PRIMARY KEY AUTO_INCREMENT,
   	Nama VARCHAR(225),
	Umur INT
   )


B. ALTER

1. NAMBAH COLUMN DI TABLE

	// ALTER TABLE (Nama Table) ADD (Nama ATRIBUT,Tipe data)

	-> ALTER TABLE mahasiswa ADD jurusan VARCHAR(255);

2. BUANG COLUMN DARI TABLE

	// ALTER TABLE (Nama Table) DROP (Nama ATRIBUT)

	-> ALTER TABLE mahasiswa DROP jurusan;

3. NAMBAHIN CONSTRAINT
	
	-> ALTER TABLE msstaff ADD CONSTRAINT ph_check CHECK(LENGTH(StaffPhoneNumber) > 12)

	// ALTER TABLE (NAMA TABLE) ADD CONSTRAINT (ALIAS CONSTRAINT) CHECK(LENGTH(NAMA ATRIBUT) (CONSTRAINTNYA APA))


C. DROP

HAPUS TABLE DARI DATABASE

	// DROP TABLE (Nama Table)

	-> DROP TABLE mahasiswa


D. TRUNCATE

HAPUS SEMUA DATA DARI TABEL

	// TRUNCATE TABLE (nama table)

	-> TRUNCATE TABLE mahasiswa


E. INSERT

MASUKIN DATA KE TABEL
	
	// INSERT INTO (Nama Table) VALUES ('Data yang mau dimasukin')

	-> INSERT INTO mahasiswa VALUES (NULL, 'Jose', 20, 'Computer Science');


F. SELECT 

NGAMBIL/NYARI DATA DARI TABEL
	
	// SELECT (COLUMN Data apa yang mau diambil -> * = SEMUA DATA. BISA DISPESIFIKIN CTH: Nama, jurusan,dll)
		FROM (Nama Table) WHERE (COLUMN Data Yang mau dicocokin) = (Isi data yang mau dicocokin)
	
	-> SELECT * FROM mahasiswa WHERE Nama = 'Sebastian';
	
	-> SELECT Nama, jurusan FROM mahasiswa WHERE Nama = 'Sebastian'
	// Nama, jurusan = COLUMN DATA YANG MAU DIAMBIL
	// BISA NAMPILIN 2 ATRIBUT DI SELECT TAPI HARUS ADA (,)


G. UPDATE

UPDATE DATA YANG ADA DI TABEL

	// UPDATE (Nama Table) SET (Data yang mau diganti columnya) = (Diganti mau jadi apa)
	   WHERE (Column Data yang dicocokin) = (Isi data yang mau dicocokin)

	-> UPDATE mahasiswa SET jurusan = 'Arsitek'
	   WHERE Nama = 'Jose Susanto'
H. DELETE

HAPUS DATA DARI TABEL TAPI SPESIFIK

	// DELETE FROM (Nama Table)
	   WHERE (Column Data yang dicocokin) = (Isi data yang mau dicocokin)
	
	-> DELETE FROM mahasiswa
	   WHERE Nama = 'Jose Susanto'
	
I. CONDITIONAL QUERY

  1. WHERE

	// NGEBANDINGI DATA DARI ATRIBUTNYA (COLUMN DATA)
	
	-- NGEBANDINGIN INTEGER
	-> SELECT *
	   FROM bakmies
	   WHERE bakmie_price < 25000

	-- NGEBANDING STRING
	-> SELECT *
	   FROM bakmies
	   WHERE bakmie_name = 'Bakmie Ayam Jamur'

  2. AND 

	// NGEBANDINGIN 2 ATRIBUT TAPI KONDISINYA HARUS TERPENUHI SEMUA
	   KALO 1 KONDISI GAK TERPENUHI JADINYA GK ADA

	-> SELECT *
	   FROM bakmies
	   WHERE bakmie_name = 'Bakmie Ayam Jamur'
	   AND
	   bakmie_name = 'Bakmie sapi Lada Hitam'

	-> SELECT *
  	  FROM bakmies
   	  WHERE bakmie_name = 'Bakmie Ayam Jamur'
	  AND
	  bakmie_price = 20000


  3. OR

	// NGEBANDINGIN 2 ATRIBUT YANG KALO KONDISINYA TERPENUHI SALAH SATU, 
	   MAKA OUTPUTNYA KELUAR SESUAI DENGAN KONDISI.

	->SELECT *
	  FROM bakmies
	  WHERE bakmie_name = 'Bakmie Ayam Jamur'
	  OR
	  bakmie_name = 'Bakmie sapi Lada Hitam'

	->SELECT *
	  FROM bakmies
	  WHERE bakmie_name = 'Bakmie Ayam Jamur'
	  OR
	  bakmie_price < 25000

  
  4. IN

	// BUAT NGEBANDINGIN DATA DARI SUATU ATRIBUT KALO DATANYA BANYAK
	   MIRIP OR CUMA LANGSUNG NGEBANDINGIN DI DALAM IN(...,...,...,n)
	   SUPAYA GAK PANJANG QUERYNYA

	->SELECT *
 	  FROM sales_header
 	  WHERE staff_id IN ('ST001' , 'ST002' , 'ST003')

	// SELECT (ATRIBUT YANG MAU DITAMPILIN)
	   FROM (TABLE YANG DIMAU)
	   WHERE (ATRIBUT YANG MAU DIBANDINGIN) IN (DATA YANG MAU DIBANDINGIN -> JANGAN LUPA PAKE () , PETIK SATU KALO STRING)



J. STRING MANIPULATION

  1. LEFT
	
	FUNGSI 1 :
	// BISA BUAT NAMPILIN HURUF DARI KIRI SUATU DATA DARI ATRIBUT

	-> SELECT customer_name, LEFT(customer_name, 2)
	   FROM customers

	// SELECT (ATRIBUT YANG DIMAU), LEFT(ATRIBUT YANG MAU DITAMPILIN DARI KIRI, BERAPA BANYAK HURUF YANG MAU DITAMPILIN	
	   FROM (Nama Table)

	-> SELECT customer_name, LEFT (customer_name , 2) AS `2 char from left`
	   FROM customers
	// GANTI NAMA ATRIBUT PAKE AS
	   -> AS `Mau diganti apa`

	
	FUNGSI 2 :
	// BISA BUAT BIKIN KONDISI 

	-> SELECT customer_name
	   FROM customers
	   WHERE LEFT (customer_name, 1) = 'E'
	// SELECT 
	   FROM (Nama Table)
	   WHERE LEFT (Atribut yang mau diambil dari, huruf/bilangan keberapa dari kiri) = HURUF/BILANGAN YANG DIMAU

  2. RIGHT 

	SAMA KAYAK LEFT CUMA NGAMBIL HURUFNYA DARI KANAN

	// QUERY SAMA KAYAK LEFT CUMA DIGANTI RIGHT AJA
	-> SELECT customer_name, RIGHT (customer_name , 7) AS `7 char from right`
	   FROM customers

  3. CONCAT

	HUBUNGIN SUATU STRING
	// BISA HUBUNGIN STRING SAMA ATRIBUT ATAU ATRIBUT DENGAN ATRIBUT

	-> SELECT CONCAT(customer_id,' ', customer_name)
 	   FROM customers
	// SELECT CONCAT(ATRIBUT/STRING, ATRIBUT/STRING)
	   FROM (Nama Table)

  4. LOWER() 
	
	NGECILIN SUATU HURUF - A -> a
	
	-> SELECT LOWER (customer_name), customer_name
	   FROM customers
	// SELECT LOWER (nama atribut)
	   FROM (nama table)

  5. UPPER()

	NGEGEDEIN SUATU HURUF - a -> A

	-> SELECT UPPER (customer_name), customer_name
	   FROM customers
	// SELECT UPPER (Nama atribut)
	   FROM (Nama Table)

  6. LENGTH()

	NYARI TAU PANJANG DARI SUATU STRING

	-> SELECT LENGTH (customer_name), customer_name
	   FROM customers
	// SELECT LENGTH (Nama Atribut yang mau dicari tau panjangnya)
	   FROM (Nama Table)

  7. LIKE 

	BUAT NYARI POLA DARI STRING

	--> % = 0/berapa pun char
	--> _ = 1 char aja

	BISA DIPAKAI SEPERT 
	
	NYARI KATA DI DEPAN = KEYWORD%
	NYARI KATA DI BELAKANG = %KEYWORD
	NYARI KATA YANG MENGANDUNG = %KEYWORD%

	-> SELECT * 
	   FROM bakmies
	   WHERE bakmie_name LIKE '%Ayam%'

	// SELECT (ATRIBUT YANG MAU DITAMPILIN)
	   FROM (NAMA TABLE)
	   WHERE (ATRIBUT YANG MAU DIBANDINGIN) LIKE (MASUKIN KEYWORD DENGAN %)

  8. LOCATE()

	BUAT NYARI CHAR DARI SEBUAH STRING POSISNYA DIMANA

	-> SELECT customer_name, LOCATE ('am', customer_name)
	   FROM customers

	// SELECT LOCATE ('char yang mau dicari', NAMA ATRIBUT DICARI)
	   FROM (NAMA TABLE)

	LOCATE BISA DIGUNAIN BUAT NGAMBIL KATA DARI KIRI ATO KANAN DIGABUNGIN SAMA
	FUNCTION LEFT SAMA RIGHT
	
	NGAMBIL KATA DARI KIRI 
	
		-> SELECT LEFT(customer_name, LOCATE(' ', customer_name)-1)
		   FROM customers
	
		// SELECT LEFT(Nama atribut , LOCATE('CHAR YANG MAU DICARI', NAMA ATRIBUT DICARI)-1)
		   FROM (Nama Table) 
		// -1 BUAT ILANGIN CHAR YANG MAU DICARI ITU SENDIRI

	NGAMBIL KATA DARI KANAN
		
		-> SELECT RIGHT(customer_name, LOCATE(' ', REVERSE(customer_name))-1)
		   FROM customers
		
		// TAMBAHIN REVERSE DI DALAM LOCATE

	LOCATE JUGA BISA NYARI DISPESIFIKIN POSISI MULAI NYARINYA
	
	-> SELECT customer_name, LOCATE ('am', customer_name, 10)
	   FROM customers
	
	// SELECT LOCATE ('char yang mau dicari', NAMA ATRIBUT DICARI, POSISI MULAI NYARI)
	   FROM (NAMA TABLE)

  9. LTRIM()

	BUAT NGILANGIN SPASI DI AWAL DARI SEBUAH STRING

	-> SELECT LTRIM('       ADMSMDMOAS')
	// SELECT LTRIM('STRINGNYA')


  10. RTRIM()

	BUAT NGILANGIN SPASI DI AKHIR DARI SEBUAH STRING

	-> SELECT LTRIM('ADMSMDMOAS        ')
	// SELECT LTRIM('STRINGNYA')

  11. FULLTEXT
	
	-> ALTER TABLE bakmies
	   ADD FULLTEXT(bakmie_name)

  12. MATCH

	BUAT NGEBANDINGIN ISI DARI ATRIBUT DENGAN STRING
	
	-> SELECT *
	   FROM bakmies
  	   WHERE MATCH (bakmie_name) AGAINST ('Bakmie')

	// SELECT (ATRIBUT YANG DITAMPILIN)
	   FROM (Nama table)
	   WHERE MATCH (ATRIBUT YAND DIBANDINGIN) AGAINST ('STRING YANG DIBANDINGIN')

  13. STRCMP

	BUAT NGEBANDING 2 STRING DENGAN OUTPUT 0, 1, -1

	0 = 2 STRING SAMA
	1 = STRING PERTAMA LEBIH BESAR DARI STRING KEDUA
	-1 = STRING PERTAMA LEBIH KECIL DARI STRING KEDUA

	-> SELECT STRCMP ('a','b')
	// SELECT STRCMP ('STRING 1', 'STRING 2')


  14. REPLACE

	NGEGANTIIN SEMUA STRING YANG KITA TENTUKAN DI SEBUAH ATRIBUT

	->SELECT REPLACE (bakmie_name, 'Bakmie', 'Bakso')
	  FROM bakmies

	//SELECT REPLACE (NAMA ATRIBUT , 'STRING YANG MAU DIGANTI', 'DIGANTI JADI APA')
	  FROM (Nama table)


  15. REVERSE
	
	NGEBALIKIN/NGECERMININ SUATU STRING

	-> SELECT REVERSE(customer_name), customer_name
	   FROM customers

	// SELECT REVERSE(NAMA ATRIBUT YANG MAU DIREVERSE)
	   FROM (Nama Table)


  16. SUBSTR

	NGAMBIL CHAR DARI SUATU STRING

	-> SELECT SUBSTR(customer_name,1,6), customer_name
	   FROM customers

	// SELECT SUBSTR(NAMA ATRIBUT YANG MAU DIAMBIL, POSISI KEBERAPA, BERAPA BANYAK CHAR)
	   FROM (Nama Table)

K. DATE FUNCTIONS

  1. ADDDATE

	NAMBAHIN TANGGAL

	-> SELECT ADDDATE(sales_date, 5), sales_date
	   FROM sales_header

	// SELECT ADDDATE(ATRIBUT YANG MAU DITAMBAHIN, BERAPA BANYAK DITAMBAH)
	   FROM (NAMA TABLE)


  2. ADDTIME

	NAMBAHIN WAKTU

	-> SELECT ADDTIME(sales_date, '1 2:13:00'), sales_date
	   FROM sales_header

	// SELECT ADDTIME(ATRIBUT YANG DITAMBAH, '(HARI) (WAKTU -> __:__:__)
	   FROM (NAMA TABLE)



  3. CURDATE/CURRENT_DATE

	BUAT NGASIH TANGGAL PADA HARI FUNCTION DIPAKE

	-> SELECT CURDATE(), 


  4. CURTIME

	BUAT NGASIH TAU WAKTU PADA SAAT TERSEBUT

	-> SELECT CURTIME()


  5. CURRENT_TIMESTAMP

	BUAT NGASIH TAU WAKTU DAN TANGGAL SAAT TERSEBUT

	-> SELECT CURRENT_TIMESTAMP()

  6. DAY, MONTH, YEAR
	
	BUAT NGASIH TAU HARI, BULAN, DAN TAHUN

	-> SELECT DAY ('2022-10-12') AS `DAY`, MONTH('2022-10-12') AS `MONTH`, YEAR ('2022-10-12') AS `YEAR`

	// DAY('TANGGAL YANG MAU DIMASUKIN ATAU BISA JUGA ATRIBUT YANG MAU DIMASUKIN')

	-> SELECT DAY (sales_date) AS `DAY`, MONTH(sales_date) AS `MONTH`, YEAR (sales_date) AS `YEAR`
	   FROM sales_header

  7. DATEDIFF

	NGASIH TAU PERBEDAAN 2 TANGGAL

	-> SELECT DATEDIFF(CURRENT_DATE(), '2022-10-11')

	// DATEDIFF(TANGGAL 1, TANGGAL 2)
	// TANGGAL BISA BERUPA CURRENT_DATE(), TANGGAL YANG DIKETIK MANUAL ATAU TANGGAL DARI KOLOM ATRIBUT)


  8. DAYNAME

	NGASIH TAU NAMA HARI DARI TANGGAL

	-> SELECT DAYNAME(sales_date), sales_date
	   FROM sales_header

	// DAYNAME(TANGGAL)
	// TANGGAL BISA DIKETIK SENDIRI, CURRENT, ATAU DARI KOLOM ATRIBUT


  9. DATE_FORMAT

	NGEFORMAT TANGGAL YANG DIINPUT 

	-> SELECT DATE_FORMAT('2022-10-12', '%a %b %e %Y')

	// DATE_FORMAT(TANGGAL YANG DIMASUKIN, 'FORMAT - FORMAT BISA LIAT DOKUMENTASI')


CATATAN PISAHAN 
-> START TRANSACTION --> DITULIS DI DEPAN
-> COMMIT --> DITULIS DIBELAKANG KLO UDH YAKIN
-> ROLLBACK --> KLO BLOM YAKIN JGN COMMIT TAPI ROLLBACK

// START TRANSACTION PLUS ROLLBACK BUAT NYOBA2




-> DELETE FROM baristas
   WHERE barista_address REGEXP ' Street$'

// DELETE FROM (Nama Table)
   WHERE (Nama atribut) REGEXP ('SESUATU YANG DICARI')


CARA NGERANDOM NUMBER 

	-> RAND()
	RAND BAKAL NGERANDOM ANGKA 0 - 1

	JADI KLO MW RANDOM ANGKA 0 - 30 
	-> RAND() * 30
	
CARA NGEFLOOR/BULETIN KEBAWAH NUMBER

	-> FLOOR()
	CONTOH : FLOOR(NUMBER)
		-> FLOOR(RAND() * 30)