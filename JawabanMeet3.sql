SEgunStore

Nomor 1
CREATE TABLE MsVendor(
	VendorID char(5) PRIMARY KEY CHECK (VendorID REGEXP 'VE[0-9]	[0-9][0-9]'),
    	VendorName varchar(255) NOT NULL CHECK (length(VendorName) > 	5),
    	VendorAddress varchar(255) NOT NULL
   )

-->Vendor id as primari key dengan const. 'VE001'
-->Vendor Name tidak boleh kosong (NOT NULL) dan harus lbh dari 5 (Check     length > 5)
-->Vendor Address tidak boleh kosong (NOT NULL)

//==============================================================//

Nomor 2
ALTER TABLE msstaff
    ADD StaffPhoneNumber varcahr(20)

-->alter table dan menambah kolom baru dengan nama staffPhoneNumber dengan     data type varchar(20)

ALTER TABLE msstaff
    ADD CONSTRAINT phone_check CHECK(length(StaffPhoneNumber) > 12)

ADD CONSTRAINT (nama constraint) CHECK (apa yg mau diberikan const.)

-->alter table untuk menambahkan constraint panjang staff phone number harus    lebih banyak dari 12

//==============================================================//

Nomor 3

insert into msgun values (9, 'Karbiner 98K', riffle, 6300000)

-->function insert untuk memasukan data ke dalam tabel yang sudah tersedia.     Values menyesuaikan value pada table yang tersedia.

//==============================================================//

Nomor 4

SELECT upper (GunName), GunType, GunPrice 
    FROM msgun
    WHERE GunPrice < 1800000

--> selecet upper untuk bikin semua huruf jadi caps dan di display. where gunprice digunakan sesuai dengan soal yang meminta harga nya lbh kecil dari berapa

//==============================================================//

Nomor 5

UPDATE  msgun SET GunPrice = 7000000 WHERE GunId = 9

-->update/ganti data pada tabel dan kolom tertentu sesuai dengan id yg diminta

//==============================================================//

Nomor 6

SELECT th.TransactionId, mc.CustomerName, ms.StaffName, mg.GunName,     td.Qty, mg.GunPrice
    FROM transactionheader AS th JOIN mscustomer as mc ON th.CustomerId     = mc.CustomerId
    JOIN msstaff AS ms on th.Staffid = ms.StaffId
    JOIN transactiondetail AS td ON th.TransactionId = td.TransactionId
    JOIN msgun AS mg ON td.GunId = mg.GunId
    WHERE ms.StaffId = 3

-->Rumus untuk join dan select

-->1. Ketik select dan kosongnkan untuk nanti diisi data apa saja yang akan     ditampilkan

-->2. From (nama tabel) AS (inisial tabel 1) JOIN (nama tabel yg memiliki     foreign key tabel sebelum) AS (inisial tabel 2) ON (inisial 1).(primary key) =     (inisial 2).(foreignkey)

-->3. dari sini dan seterusnya cocokan antara tiap primary dan foreign key tabel     yg berhubungan untuk dijoin. 
-->JOIN (nama tabel) AS (inisial 3) ON (inisial 1/2).(foreign key) = (inisial.3).    (primary key)