Use QuanLyCafe;
GO

-- Các bảng như sau:
-- Table Food
-- Account
-- FoodCategory
-- Food
-- Bill
-- BillInfo


CREATE TABLE TableFood
(
IdTableFood INT IDENTITY NOT NULL Primary Key,
NameTableFood nvarchar(50) NOT NULL DEFAULT N'Bàn chưa có tên',
Status nvarchar(100) DEFAULT N'Bàn trống' -- Trạng thái có or không có người.
)
Go
CREATE TABLE Account
(
IdAccount INT IDENTITY NOT NULL Primary Key,
Ho nvarchar(50) NOT NULL DEFAULT N'Chưa đặt họ',
Ten nvarchar(50) NOT NULL DEFAULT N'Chưa đặt tên',
UserName varchar(50) NOT NULL,
PassWord varchar(50) NOT NULL,
Type INT NOT NULL DEFAULT 0 -- 1 là Admin, 0 là member
)
GO
CREATE TABLE FoodCategory
(
IdFoodCategory INT IDENTITY NOT NULL Primary Key,
NameCategory nvarchar(50) NOT NULL DEFAULT N'Chưa đặt tên thể loại đồ uống'
)
GO
CREATE TABLE Food
(
IdFood INT IDENTITY NOT NULL Primary Key,
NameFood nvarchar(50) NOT NULL DEFAULT N'Chưa đặt tên đồ uống',
IdCategory INT NOT NULL,
Price FLOAT NOT NULL,
FOREIGN KEY(IdCategory) REFERENCES FoodCategory(IdFoodCategory)
)
GO
CREATE TABLE Bill
(
IdBill INT IDENTITY NOT NULL Primary Key,
DateCheckIn Date NOT NULL DEFAULT GETDATE(),
DateCheckCut Date,
IdTable INT NOT NULL,
Status INT NOT NULL, -- 1 là đã thanh toán, 0 là chưa thanh toán
FOREIGN KEY(IdTable) REFERENCES TableFood(IdTableFood)
)
GO
CREATE TABLE BillInfo
(
Id INT IDENTITY Primary Key,
IdBill INT NOT NULL,
IdFood INT NOT NULL,
Count INT NOT NULL DEFAULT 0,
FOREIGN KEY(IdBill) REFERENCES Bill(IdBill),
FOREIGN KEY(IdFood) REFERENCES Food(IdFood)
)
GO

