create database FashionShop;
use FashionShop

-- tạo bảng 
create table category
(
	Category_id nvarchar(50) NOT NULL primary key,
	Category_name nvarchar(50)
);

create table product
(
	Product_id nvarchar(50) NOT NULL primary key,
	image_product nvarchar(MAX),
	Name_product nvarchar(50),
	Category_id nvarchar(50) foreign key references category(Category_id),
	price int,
	DateCreate datetime,
	Stock bit,
	rating float
);

create table roleDetail
(
	RoleID nvarchar(50) NOT NULL primary key,
	Name_Role nvarchar(50),
);

create table account
(
	accID nvarchar(50) NOT NULL primary key,
	Username nvarchar(50),
	Pass nvarchar(50),
	FullName nvarchar(50),
	RoleID nvarchar(50) foreign key references roleDetail(RoleID),
	StatusAcc bit
);

create table [dbo].[OrderDetail]
(
	DOID nvarchar(50) NOT NULL foreign key references [dbo].[Order](OID),
	Product_id nvarchar(50) NOT NULL foreign key references product(Product_id),
	quantity int,
	total float,
	CONSTRAINT PK_OrderDetail PRIMARY KEY (DOID, Product_id) 
);

create table [dbo].[Order]
(
	OID nvarchar(50) NOT NULL,
	accID nvarchar(50) foreign key references account(accID), 
	total float,
	DateOrder datetime,
	CONSTRAINT PK_ORDER PRIMARY KEY (OID) 
);


-- insert dữ liệu vào bảng
-- insert category
insert into category values ('C1', 'T Shirt') 
insert into category values('C2', 'Pants ') 
insert into category values('C3', 'Hat') 


-- insert product
insert into product values ('P0001', 'img/cream_grid.jpg','Cream Grid','C1',234000, GETDATE(), 1, 5)
insert into product values ('P0002', 'img/mocha_cap.jpg','Mocha Cap','C3',190000, GETDATE(), 1, 4.8)
insert into product values ('P0003', 'img/polo-wash.jpg','Polo Wash','C1',390000, GETDATE(), 1, 4.6)
insert into product values ('P0004', 'img/jean_black.jpg','Jean Black','C2',590000, GETDATE(), 1, 4.9)
insert into product values ('P0005', 'img/slystar_white.jpg','Slystar White','C1',350000, GETDATE(), 1, 4.5)	
insert into product values ('P0006', 'img/cream_cap.jpg','Cream Cap','C3',190000, GETDATE(), 1, 5)
insert into product values ('P0007', 'img/para_black.jpg','Para Black','C2',490000, GETDATE(), 1, 4.6)
insert into product values ('P0008', 'img/slystar_p_white.jpg','White SLYSTAR Track Pants','C2',390000, GETDATE(), 1, 4)

--insert Role
insert into roleDetail values('R01', 'Admin')
insert into roleDetail values('R02', 'User')

insert into account values ('A01','admin', 'admin', 'Cocou','R01', 'true')
insert into account values ('A02','tan', '12345', 'Tran Hoang Nhat Tan','R01', 'true')
