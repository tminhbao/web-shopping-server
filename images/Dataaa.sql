-- drop database laptop_webshop;
create database if not exists laptop_webshop;

use laptop_webshop;

create TABLE if NOT EXISTS checkout 
(
    id int auto_increment,
    created DATETIME,
    user_id int,
	firstname varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    lastname varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
	email varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    address varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    phone varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    note varchar(255) COLLATE utf8mb4_unicode_ci,
    state varchar(255) COLLATE utf8mb4_unicode_ci,
    primary key (id)
);
CREATE TABLE if NOT EXISTS shoppingcart 
(   
    id int AUTO_INCREMENT, 
    laptop_id varchar(20), 
    user_id int(11), 
    image varchar(255), 
    price bigint unsigned, 
    quantity int, 
    PRIMARY KEY(id) 
);

CREATE TABLE if NOT EXISTS shoppingcartdb
(   
    id int AUTO_INCREMENT, 
    laptop_id varchar(20), 
    user_id int(11), 
    image varchar(255), 
    price bigint unsigned, 
    quantity int, 
    PRIMARY KEY(id) 
);

create table if not exists comments
(
	id int(11) not null auto_increment,
    laptop_id varchar(20) not null,
    username nvarchar(50) not null,
    content nvarchar(255),
    primary key (id)
); 
CREATE TABLE admins (
  id int(11) NOT NULL AUTO_INCREMENT,
  fullname varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  address varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  telephone varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  username varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  password varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY username (username)
 ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE users (
  id int(11) NOT NULL AUTO_INCREMENT,
  email varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  firstname varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  lastname varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  mob_no varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  address varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  token varchar(255),
  password varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY email (email)
 ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

create table if not exists actor
(
	actor_id varchar(20) unique not null,
    actor_name varchar(255) character set utf8mb4 not null,
    age tinyint,
    gender varchar(10),
    phone char(10) not null,
    address varchar(255) character set utf8mb4 not null,
    email varchar(30) not null,
    actor_username varchar(20) not null unique,
    actor_password varchar(20) not null,
    created datetime,
    is_admin boolean not null,
    
    constraint PK_actor primary key (actor_id),
    constraint Chk_actor check (age between 0 and 100)
);

create table if not exists manufacture
(
	manufacture_id varchar(20) unique not null,
    manufacture_name varchar(255) not null,
    manufacture_description text,
    
    constraint PK_manufacture primary key (manufacture_id)
);

create table if not exists model
(
	model_id varchar(20) unique not null,
    model_name varchar(255) not null,
    manufacture_id varchar(20),
    model_description text,
    
    constraint PK_model primary key (model_id)
);

create table if not exists laptop
(
	laptop_id varchar(20) unique not null,
    manufacture varchar(20) not null,
    model varchar(20) not null,
    laptop_name varchar(255) character set utf8mb4 not null,
    laptop_description text,
    laptop_cpu varchar(255),
    laptop_ram varchar(255),
    laptop_vga varchar(255),
    laptop_disk varchar(255),
    image varchar(255),
    cost bigint unsigned,
    price bigint unsigned,
    inventory mediumint unsigned,
    
    constraint PK_product primary key (laptop_id)
);

create table if not exists discount
(
	discount_id varchar(20) unique not null,
    laptop_id varchar(20) not null,
    discount_percent tinyint not null,
    start_at datetime not null,
    end_at datetime not null,
    
    constraint Chk_discount check ((discount_percent between 0 and 100) and (start_at <= end_at)),
    constraint PK_discount primary key (discount_id)
);

create table if not exists cart
(
	cart_id varchar(20) unique not null,
    actor_id varchar(20),
    cart_status varchar(50) character set utf8mb4 not null,
    total_money bigint unsigned,
    updated_at datetime,
    
    constraint PK_cart primary key (cart_id)
);

create table if not exists cartDetail
(
	detail_id varchar(20) unique not null,
    cart_id varchar(20) not null,
    laptop_id varchar(20) not null,
    quantity mediumint unsigned not null,
    
    constraint PK_cartDetail primary key (detail_id, cart_id)
);

create table if not exists purchaseOrder
(
	order_id varchar(20) unique not null,
    cart_id varchar(20) not null,
    created_at datetime,
    order_status varchar(50) character set utf8mb4 not null,
    
    constraint PK_order primary key (order_id)
);

create table if not exists receiptInvoice
(
	receipt_id varchar(20) unique not null,
    admin_id varchar(20),
    created_at datetime,
    total_money bigint unsigned,
    
    constraint PK_receipt primary key (receipt_id)
);

create table if not exists receiptInvoiceDetail
(
	detail_id varchar(20) unique not null,
    invoice_id varchar(20) not null,
    laptop_id varchar(20) not null,
    quantity mediumint unsigned not null,
    money bigint unsigned,
    
    constraint PK_receiptDetail primary key (detail_id, invoice_id)
);

create table if not exists salesInvoice
(
	sales_id varchar(20) unique not null,
    customer_id varchar(20),
    created_at datetime,
    total_money bigint unsigned,
    
    constraint PK_sakes primary key (sales_id)
);

create table if not exists salesInvoiceDetail
(
	detail_id varchar(20) unique not null,
    invoice_id varchar(20) not null,
    laptop_id varchar(20) not null,
    quantity mediumint unsigned not null,
    money bigint unsigned,
    
    constraint PK_salesDetail primary key (detail_id, invoice_id)
);

create table if not exists feedback
(
	feedback_id varchar(20) unique not null,
    laptop_id varchar(20) not null,
    customer_name varchar(100) character set utf8mb4 not null,
    created_at datetime,
    content text,
    
    constraint PK_feedback primary key (feedback_id, laptop_id)
);

alter table model
add constraint FK_model_manufacture
foreign key (manufacture_id) references manufacture(manufacture_id);

alter table laptop
add constraint FK_laptop_model
foreign key (model) references model(model_id);

alter table discount
add constraint FK_discount_laptop
foreign key (laptop_id) references laptop(laptop_id);
--
alter table cart
add constraint FK_cart_actor
foreign key (actor_id) references actor(actor_id);

alter table cartDetail
add constraint FK_cartDetail_cart
foreign key (cart_id) references cart(cart_id);

alter table cartDetail
add constraint FK_cartDetail_laptop
foreign key (laptop_id) references laptop(laptop_id);

alter table purchaseOrder
add constraint FK_order_cart
foreign key (cart_id) references cart(cart_id);

alter table receiptInvoice
add constraint FK_receipt_actor
foreign key (admin_id) references actor(actor_id);

alter table receiptInvoiceDetail
add constraint FK_receiptDetail_receiptInvoice
foreign key (invoice_id) references receiptInvoice(receipt_id);

alter table receiptInvoiceDetail
add constraint FK_receiptDetail_laptop
foreign key (laptop_id) references laptop(laptop_id);

alter table salesInvoice
add constraint FK_sales_actor
foreign key (customer_id) references actor(actor_id);

alter table salesInvoiceDetail
add constraint FK_salesDetail_salesInvoice
foreign key (invoice_id) references salesInvoice(sales_id);

alter table salesInvoiceDetail
add constraint FK_salesDetail_laptop
foreign key (laptop_id) references laptop(laptop_id);

alter table feedback
add constraint FK_feedback_laptop
foreign key (laptop_id) references laptop(laptop_id);
insert into 
	actor(actor_id, actor_name, age, gender, phone, address, email, actor_username, actor_password, created, is_admin)
values
	('actor001', 'Trần Vũ Việt Cường', 21, 'Male', '0337543594', 'TP. Hồ Chí Minh', '19120465@student.hcmus.edu.vn', '19120465', 'admin', '2021-11-24', true),
    ('actor002', 'Trần Minh Bảo', 20, 'Male', '0xxxxxxxxx', 'TP. Hồ Chí Minh', '19120457@student.hcmus.edu.vn', '19120457', 'admin', '2021-11-24', true),
    ('actor003', 'Lưu Đức Vũ', 20, 'Male', '0xxxxxxxxx', 'TP. Hồ Chí Minh', '19120433@student.hcmus.edu.vn', '19120433', 'admin', '2021-11-24', true);
    
    
insert into
	manufacture(manufacture_id, manufacture_name, manufacture_description)
values
	('manufac001', 'Macbook', null),
    ('manufac002', 'Asus', null),
    ('manufac003', 'Dell', null),
    ('manufac004', 'Acer', null),
    ('manufac005', 'HP', null),
    ('manufac006', 'Lenovo', null),
    ('manufac007', 'Microsoft', null),
    ('manufac008', 'MSI', null);

insert into 
	model(model_id, model_name, manufacture_id, model_description)
values
	('model001', 'Air 2020', 'manufac001', null),
    ('model002', 'Pro 2020', 'manufac001', null),
    ('model003', 'M1 2021', 'manufac001', null),
    ('model004', 'ROG', 'manufac002', null),
    ('model005', 'Zenbook', 'manufac002', null),
    ('model006', 'TUF Gaming', 'manufac002', null),
    ('model007', 'VivoBook', 'manufac002', null),
    ('model008', 'G Gaming', 'manufac003', null),
    ('model009', 'Vostro', 'manufac003', null),
    ('model010', 'Inspiron', 'manufac003', null),
    ('model011', 'Predator', 'manufac004', null),
    ('model012', 'Nitro', 'manufac004', null),
    ('model013', 'Swift', 'manufac004', null),
    ('model014', 'Aspire', 'manufac004', null),
    ('model015', 'Envy', 'manufac005', null),
    ('model016', 'Pavilion', 'manufac005', null),
    ('model017', 'ThinkPad', 'manufac006', null),
    ('model018', 'Legion', 'manufac006', null),
    ('model019', 'Yoga', 'manufac006', null),
    ('model020', 'ThinkBook', 'manufac006', null),
    ('model021', 'IdeaPad', 'manufac006', null),
    ('model022', 'Surface', 'manufac007', null),
    ('model023', 'GF Series', 'manufac008', null),
    ('model024', 'Katana', 'manufac008', null),
    ('model025', 'Stealth', 'manufac008', null);

-- ('laptop001', '', 'model001', '', '', '', '', '', '', 'images/product/laptop001.png', 0, 0, 0),
    
insert into 
	laptop(laptop_id, manufacture, model, laptop_name, laptop_description, laptop_cpu, laptop_ram, laptop_vga, laptop_disk, image, cost, price, inventory)
values
	('laptop001', '', 'model002', '13inches Touch Bar 2.0GHz Core i5 512GB', '', 'Intel Core i5-10th-gen', '16GB LPDDR4X  3733MHz', 'Intel Iris Plus Graphics', 'SSD 512GB', 'images/product/laptop001.png', 0, 46999000, 0),
    ('laptop002', '', 'model001', '13inches M1 256GB', '', 'Apple M1', '8GB LPDDR4X 3200MHz', 'Apple M1 GPU 7 nhân', 'SSD 256GB', 'images/product/laptop002.png', 0, 28999000, 0),
    ('laptop003', '', 'model002', '13inches Touch Bar M1 256GB', '', 'Apple M1', '8GB LPDDR4X 3200MHz', 'Apple M1 GPU 8 nhân', 'SSD 256GB', 'images/product/laptop003.png', 0, 34999000, 0),
    ('laptop004', '', 'model002', '13inches Touch Bar M1 256GB', '', 'Apple M1', '16GB LPDDR4X 3730MHz', 'Apple M1 GPU 8 nhân', 'SSD 256GB', 'images/product/laptop004.png', 0, 39999000, 0),
    ('laptop005', '', 'model003', '14inches M1 Pro 512GB', '', 'Apple M1 Pro', '16GB LPDDR4X 4266MHz', 'Apple M1 GPU 8 nhân', 'SSD 512GB', 'images/product/laptop005.png', 0, 52999000, 0),
    ('laptop006', '', 'model003', '16inches M1 Pro 512GB', '', 'Apple M1 Pro', '16GB LPDDR4X 4266MHz', 'Apple M1 GPU 8 nhân', 'SSD 512GB', 'images/product/laptop006.png', 0, 65999000, 0),
    ('laptop007', '', 'model003', '16inches M1 Max1 1TB', '', 'Apple M1 Pro', '32GB', 'Apple M1 GPU 8 nhân', 'SSD 1TB', 'images/product/laptop007.png', 0, 92999000, 0),
	('laptop008', '', 'model004', 'FLow Gaming GV301QC-K6052T', '', 'AMD Ryzen 9 5900HX', '16GB LPDDR4X 3200MHz', 'NVIDIA GeForce RTX3050 4GB', 'SSD 512GB', 'images/product/laptop008.png', 0, 35999000, 0),
	('laptop009', '', 'model004', 'Gaming Zephyrus GA401IHR-HZ009T', '', 'AMD Ryzen 7 4800HS', '8GB DDR4 3200MHZ', 'NVIDIA GeForce GTX 1650 4GB', 'SSD 512GB', 'images/product/laptop009.png', 0, 26999000, 0),
	('laptop010', '', 'model005', 'UX371EA-HL494TS', '', 'Intel Core i7 1165G7', '16GB LPDDR4X 4267MHz', 'Intel Iris Xe Graphics', 'SSD 1TB', 'images/product/laptop010.png', 0, 40699000, 0),
	('laptop011', '', 'model005', 'Duo UX482EA-KA268T', '', 'Intel Core i7 1165G7', '16GB LPDDR4X 4267MHz', 'Intel Iris Xe Graphics', 'SSD 1TB', 'images/product/laptop011.png', 0, 38499000, 0),
	('laptop012', '', 'model005', 'Duo UX482EA-KA081T', '', 'Intel Core i5 1135G7', '8GB LPDDR4X 4267MHz', 'Intel Iris Xe Graphics', 'SSD 512GB', 'images/product/laptop012.png', 0, 31499000, 0),
	('laptop013', '', 'model005', 'Flip UX363EA-HP532T', '', 'Intel Core i5 1135G7', '8GB LPDDR4X 4267MHz', 'Intel Iris Xe Graphics', 'SSD 512GB', 'images/product/laptop013.png', 0, 26799000, 0),
	('laptop014', '', 'model005', 'UX425EA-KI429T', '', 'Intel Core i5 1135G7', '8GB LPDDR4X 3200MHz', 'Intel Iris Xe Graphics', 'SSD 512GB', 'images/product/laptop014.png', 0, 23199000, 0),
	('laptop015', '', 'model006', 'FX516PM-HN002T', '', 'Intel Core i7 11370H', '8GB DDR4 3200MHz', 'NVIDIA Geforce RTX3060 6GB', 'SSD 512GB', 'images/product/laptop015.png', 0, 31999000, 0),
	('laptop016', '', 'model006', 'FX506LH-HN002T', '', 'Intel Core i5 10300H', '8GB DDR4 2933MHz', 'NVIDIA GeForce GTX 1650 4GB-GDDR6', 'SSD 512GB', 'images/product/laptop016.png', 0, 21399000, 0),
	('laptop017', '', 'model006', 'FX706HC-HX009T', '', 'Intel Core i7 11800H', '8GB DDR4 3200MHz', 'NVIDIA Geforce RTX3050 4GB', 'SSD 512GB', 'images/product/laptop017.png', 0, 27999000, 0),
	('laptop018', '', 'model007', 'A515EA-L11970T', '', 'Intel Core i5 1135G7', '8GB DDR4 3200MHz', 'Intel Iris Xe Graphics', 'SSD 512GB', 'images/product/laptop018.png', 0, 19199000, 0),
	('laptop019', '', 'model007', 'M513UA-L1230T', '', 'AMD Ryzen 5 5500U', '8GB DDR4 3200MHz', 'AMD Radeon Graphics', 'SSD 512GB', 'images/product/laptop019.png', 0, 18199000, 0),
	('laptop020', '', 'model007', 'Pro M3500QC-L1085T', '', 'AMD Ryzen 5 5800H', '16GB DDR4 2666MHz', 'NVIDIA Geforce RTX3050 4GB', 'SSD 512GB', 'images/product/laptop020.png', 0, 29099000, 0),
	('laptop021', '', 'model007', 'Pro M3500QC-L1105T', '', 'AMD Ryzen 5 5600H', '8GB DDR4 2666MHz', 'NVIDIA Geforce RTX3050 4GB', 'SSD 512GB', 'images/product/laptop021.png', 0, 25799000, 0),
	('laptop022', '', 'model007', 'A515EP-BQ196T', '', 'Intel Core i7 1165G7', '8GB DDR4 3200MHz', 'NVIDIA Geforce MX330 2GB', 'SSD 512GB', 'images/product/laptop022.png', 0, 22499000, 0),
	('laptop023', '', 'model007', 'Pro M3401QA-KM040T', '', 'AMD Ryzen 7 5800H', '8GB DDR4 2666MHz', 'AMD Radeon Graphics', 'SSD 512GB', 'images/product/laptop023.png', 0, 22999000, 0),
	('laptop024', '', 'model007', 'A515EP-BQ496T', '', 'Intel Core i5 1135G7', '8GB DDR4 3200MHz', 'NVIDIA Geforce MX330 2GB', 'SSD 512GB', 'images/product/laptop024.png', 0, 20099000, 0),
	('laptop025', '', 'model007', 'A515EA-L11970W', '', 'Intel Core i5 1135G7', '8GB DDR4 3200MHz', 'Intel Iris Xe Graphics', 'SSD 512GB', 'images/product/laptop025.png', 0, 19999000, 0),
	('laptop026', '', 'model007', 'X515EP-BQ189T', '', 'Intel Core i5 1135G7', '8GB DDR4 3200MHz', 'NVIDIA Geforce MX330 2GB', 'SSD 512GB', 'images/product/laptop026.png', 0, 18199000, 0),
	('laptop027', '', 'model007', 'X515EA-BQ993T', '', 'Intel Core i5 1135G7', '8GB DDR4 3200MHz', 'Intel Iris Xe Graphics', 'SSD 512GB', 'images/product/laptop027.png', 0, 18999000, 0),
	('laptop028', '', 'model007', 'X515EA-BR1409T', '', 'Intel Core i5 1135G7', '8GB DDR4 2666MHz', 'Intel Iris Xe Graphics', 'SSD 512GB', 'images/product/laptop028.png', 0, 17599000, 0),
	('laptop029', '', 'model007', 'A515EA-BN1688T', '', 'Intel Core i3 1115G4', '8GB DDR4 2666MHz', 'Intel UHD Graphics', 'SSD 256GB', 'images/product/laptop029.png', 0, 15999000, 0),
	('laptop030', '', 'model007', 'X515EA-BQ1005T', '', 'Intel Core i3 1115G7', '8GB DDR4 3200MHz', 'Intel UHD Graphics', 'SSD 512GB', 'images/product/laptop030.png', 0, 14999000, 0),
	('laptop031', '', 'model008', 'G5 5500', '', 'Intel Core i7 10750H', '16GB DDR4 2933MHz', 'NVIDIA GeForce RTX 2070 8GB GDDR6', 'SSD 512GB', 'images/product/laptop031.png', 0, 37999000, 0),
    ('laptop032', '', 'model008', 'G7 15 7500', '', 'Intel Core i7 10750H', '8GB DDR4 2933MHz', 'NVIDIA® GeForce® GTX 1660Ti 6GB', 'SSD 512GB', 'images/product/laptop032.png', 0, 36999000, 0),
    ('laptop033', '', 'model008', 'G15 5511', '', 'Intel Core i7 11800H', '8GB DDR4 3200MHz', 'NVIDIA GeForce RTX 3050 4GB', 'SSD 512GB', 'images/product/laptop033.png', 0, 32999000, 0),
	('laptop034', '', 'model009', 'V3400', '', 'Intel Core i5 1135G7', '8GB DDR4 3200MHz', 'Intel UHD Graphics', 'SSD 256GB', 'images/product/laptop034.png', 0, 17899000, 0),
    ('laptop035', '', 'model009', 'V3400', '', 'Intel Core i5 1135G7', '8GB DDR4 3200MHz', 'NVIDIA® GeForce® MX330 2GB', 'SSD 512GB', 'images/product/laptop035.png', 0, 21329000, 0),
    ('laptop036', '', 'model009', 'V3405', '', 'AMD Ryzen 5 3500U', '8GB DDR4 2400MHz', 'AMD Radeon Graphics', 'SSD 512GB', 'images/product/laptop036.png', 0, 17499000, 0),
    ('laptop037', '', 'model009', 'V3400', '', 'Intel Core i7 1165G7', '8GB DDR4 3200MHz', 'NVIDIA® GeForce® MX330 2GB', 'SSD 512GB', 'images/product/laptop037.png', 0, 25219000, 0),
    ('laptop038', '', 'model009', 'V5410', '', 'Intel Core i5 11320G7', '8GB DDR4 3200MHz', 'Intel Iris Xe Graphics', 'SSD 512GB', 'images/product/laptop038.png', 0, 22999000, 0),
    ('laptop039', '', 'model009', 'V3510', '', 'Intel Core i5 1135G7', '8GB DDR4 3200MHz', 'Intel Iris Xe Graphics', 'SSD 512GB', 'images/product/laptop039.png', 0, 20399000, 0),
	('laptop040', '', 'model010', 'N3511', '', 'Intel Core i3 1115G4', '4GB DDR4 2666 MHz', 'Intel UHD Graphics', 'SSD 256GB', 'images/product/laptop040.png', 0, 14499000, 0),
	('laptop041', '', 'model010', 'N3505', '', 'AMD Ryzen 5 3450U', '8GB DDR4 3200MHz', 'AMD Radeon Graphics', 'SSD 256GB', 'images/product/laptop041.png', 0, 16999000, 0),
	('laptop042', '', 'model010', 'N3510', '', 'Intel Celeron N4020', '4GB DDR4 3200MHz', 'Intel UHD Graphics', 'SSD 128GB', 'images/product/laptop042.png', 0, 9999000, 0),
	('laptop043', '', 'model010', 'N3510', '', 'Intel Pentium N5030', '8GB DDR4 3200MHz', 'Intel UHD Graphics', 'SSD 128GB', 'images/product/laptop043.png', 0, 10699000, 0),
	('laptop044', '', 'model010', 'N5510', '', 'Intel Core i5 11300H', '8GB DDR4 3200MHz', 'Intel Iris Xe Graphics', 'SSD 256GB', 'images/product/laptop044.png', 0, 22329000, 0),
	('laptop045', '', 'model010', 'N3511', '', 'Intel Core i7 1165G7', '8GB DDR4 3200MHz', 'NVIDIA GeForce MX250 2GB', 'SSD 512GB', 'images/product/laptop045.png', 0, 25709000, 0),
	('laptop046', '', 'model010', 'N3501', '', 'Intel Core i7 1165G7', '8GB DDR4 3200MHz', 'NVIDIA GeForce MX330 2GB', 'SSD 512GB', 'images/product/laptop046.png', 0, 23869000, 0),
	('laptop047', '', 'model010', 'N5515', '', 'AMD Ryzen 7 5700U', '8GB DDR4 3200MHz', 'Radeon RX Graphics', 'SSD 512GB', 'images/product/laptop047.png', 0, 23599000, 0),
	('laptop048', '', 'model010', 'N3511', '', 'Intel Core i5 1135G7', '8GB DDR4 3200MHz', 'NVIDIA GeForce MX250 2GB', 'SSD 512GB', 'images/product/laptop048.png', 0, 22329000, 0),
	('laptop049', '', 'model010', 'N3501', '', 'Intel Core i5 1135G7', '8GB DDR4 3200MHz', 'NVIDIA GeForce MX330 2GB', 'SSD 512GB', 'images/product/laptop049.png', 0, 21829000, 0),
	('laptop050', '', 'model010', 'N3510', '', 'Intel Celeron N4020', '4GB DDR4 3200MHz', 'Intel UHD Graphics', 'SSD 128GB', 'images/product/laptop050.png', 0, 10499000, 0),
	('laptop051', '', 'model011', 'Helios Gaming PH315-54-75YD', '', 'Intel Core i7 11800H', '16GB DDR4 3200MHz', 'NVIDIA Geforce RTX3060 6GB', 'SSD 512GB', 'images/product/laptop051.png', 0, 37999000, 0),
	('laptop052', '', 'model011', 'Triton Gaming PT315-53-75LQ', '', 'Intel Core i7 11800H', '8GB DDR4 3200MHz', 'NVIDIA Geforce RTX3060 6GB', 'SSD 512GB', 'images/product/laptop052.png', 0, 39999000, 0),
	('laptop053', '', 'model011', 'Triton Gaming PT315-53-71DJ', '', 'Intel Core i7 11800H', '8GB DDR4 3200MHz', 'NVIDIA Geforce RTX3070 8GB', 'SSD 512GB', 'images/product/laptop053.png', 0, 45999000, 0),
	('laptop054', '', 'model012', 'Gaming AN515-57-74NU', '', 'Intel Core i7 11800H', '8GB DDR4 3200MHz', 'NVIDIA GeForce RTX 3050Ti 4GB', 'SSD 512GB', 'images/product/laptop054.png', 0, 28199000, 0),
	('laptop055', '', 'model012', 'Gaming AN515-57-57MX', '', 'Intel Core i5 11400H', '8GB DDR4 3200MHz', 'NVIDIA GeForce RTX 3050Ti 4GB', 'SSD 512GB', 'images/product/laptop055.png', 0, 26124000, 0),
	('laptop056', '', 'model012', 'Gaming AN515-57-54MV', '', 'Intel Core i5 11400H', '8GB DDR4 3200MHz', 'NVIDIA GeForce RTX 3050 4GB', 'SSD 512GB', 'images/product/laptop056.png', 0, 25174000, 0),
	('laptop057', '', 'model012', 'Gaming AN515-45-R9SC', '', 'AMD Ryzen 7 5800H', '8GB DDR4 3200MHz', 'NVIDIA Geforce RTX3070 8GB', 'SSD 512GB', 'images/product/laptop057.png', 0, 35499000, 0),
	('laptop058', '', 'model012', 'Gaming AN515-57-5831', '', 'Intel Core i5 11400H', '8GB DDR4 3200MHz', 'NVIDIA GeForce RTX 3060 6GB', 'SSD 512GB', 'images/product/laptop058.png', 0, 31349000, 0),
	('laptop059', '', 'model012', 'Gaming AN515-57-720A', '', 'Intel Core i7 11800H', '8GB DDR4 3200MHz', 'NVIDIA GeForce RTX 3050Ti 4GB', 'SSD 512GB', 'images/product/laptop059.png', 0, 28999000, 0),
	('laptop060', '', 'model012', 'Gaming AN515-57-71VV', '', 'Intel Core i7 11800H', '8GB DDR4 3200MHz', 'NVIDIA GeForce RTX 3050 4GB', 'SSD 512GB', 'images/product/laptop060.png', 0, 27199000, 0),
	('laptop061', '', 'model012', 'Gaming AN515-57-56S5', '', 'Intel Core i5 11400H', '8GB DDR4 3200MHz', 'NVIDIA GeForce GTX 1650 4GB', 'SSD 512GB', 'images/product/laptop061.png', 0, 22499000, 0),
	('laptop062', '', 'model012', 'Gaming AN515-45-R3SM', '', 'AMD Ryzen 5 5600H', '8GB DDR4 3200MHz', 'NVIDIA GeForce GTX 1650 4GB', 'SSD 512GB', 'images/product/laptop062.png', 0, 22199000, 0),
	('laptop063', '', 'model013', '3 SF314-43-R4X3', '', 'AMD Ryzen 5 5500U', '16GB LPDDR4X 2133MHz', 'AMD Radeon Graphics', 'SSD 512GB', 'images/product/laptop063.png', 0, 19499000, 0),
	('laptop064', '', 'model014', 'Gaming A715-42G-R4ST', '', 'AMD Ryzen 5 5500U', '8GB DDR4 3200MHz', 'NVIDIA GeForce GTX 1650 4G-GDDR6', 'SSD 256GB', 'images/product/laptop064.png', 0, 18999000, 0),
	('laptop065', '', 'model014', 'Gaming A715-42G-R05G', '', 'AMD Ryzen 5 5500U', '8GB DDR4 3200MHz', 'NVIDIA GeForce GTX 1650 4GB', 'SSD 512GB', 'images/product/laptop065.png', 0, 20499000, 0),
	('laptop066', '', 'model014', 'Gaming A715-42G-R1SB', '', 'AMD Ryzen 5 5500U', '8GB DDR4 3200MHz', 'NVIDIA GeForce GTX 1650 4GB', 'SSD 256GB', 'images/product/laptop066.png', 0, 19699000, 0),
	('laptop067', '', 'model014', '3 A315-57G-524Z', '', 'Intel Core i5 1035G1', '8GB DDR4 3200MHz', 'NVIDIA GeForce MX330 2GB', 'SSD 512GB', 'images/product/laptop067.png', 0, 16199000, 0),
	('laptop068', '', 'model014', 'A315-57G-31YD', '', 'Intel Core i3 1005G1', '4GB DDR4 2666MHz', 'NVIDIA GeForce MX330-2GB DDR5', 'SSD 256GB', 'images/product/laptop068.png', 0, 13090000, 0),
	('laptop069', '', 'model015', '13-ba1535TU', '', 'Intel Core i7-1165G7', '8GB DDR4 3200MHz', 'Intel Iris Xe Graphics', 'SSD 512GB', 'images/product/laptop069.png', 0, 29019000, 0),
    ('laptop070', '', 'model015', 'x360-13-ay0069AU', '', 'AMD Ryzen 7-4700U', '8GB DDR4 3200MHz', 'AMD Radeon Graphics', 'SSD 256GB', 'images/product/laptop070.png', 0, 27199000, 0),
	('laptop071', '', 'model016', 'Gaming 15-dk1159TX', '', 'Intel Core i7 10750H', '8GB DDR4 2933MHz', 'NVIDIA® GeForce® GTX1650 4GB', 'SSD 512GB', 'images/product/laptop071.png', 0, 27990000, 0),
	('laptop072', '', 'model016', '15-eg0504TU', '', 'Intel Core i7 1165G7', '8GB DDR4 3200MHz', 'Intel Iris Xe Graphics', 'SSD 512GB', 'images/product/laptop072.png', 0, 22019000, 0),
	('laptop073', '', 'model016', '14-dv0042TU', '', 'Intel Core i5 1135G7', '8GB DDR4 3200MHz', 'Intel Iris Xe Graphics', 'SSD 256GB', 'images/product/laptop073.png', 0, 17190000, 0),
	('laptop074', '', 'model017', 'X1 Nano', '', 'Intel Core i5 1130G7', '16GB LPDDR4X 4266MHz', 'Intel Iris Xe Graphics', 'SSD 512GB', 'images/product/laptop074.png', 0, 46499000, 0),
    ('laptop075', '', 'model017', 'X1 Carbon', '', 'Intel Core i5 1135G7', '16GB LPDDR3 4266MHz', 'Intel Iris Xe Graphics', 'SSD 512GB', 'images/product/laptop075.png', 0, 45499000, 0),
    ('laptop076', '', 'model018', 'Gaming 5', '', 'AMD Ryzen 7 4800H', '16GB DDR4 3200MHz', 'NVIDIA® GeForce® GTX1650Ti 4GB', 'SSD 512GB', 'images/product/laptop076.png', 0, 28999000, 0),
    ('laptop077', '', 'model019', 'Slim 7 14ITL05', '', 'Intel Core i5 1135G7', '16GB DDR4 3200MHz', 'Intel Iris Xe Graphics', 'SSD 512GB', 'images/product/laptop077.png', 0, 22699000, 0),
    ('laptop078', '', 'model019', 'Slim 7 14ITL05', '', 'Intel Core i7 1165G7', '16GB DDR4 3200MHz', 'Intel Iris Xe Graphics', 'SSD 512GB', 'images/product/laptop078.png', 0, 28199000, 0),
    ('laptop079', '', 'model019', '7 14ACN6', '', 'AMD Ryzen 7 5800U', '8GB LPDDR4X 4266MHz', 'AMD Radeon Graphics', 'SSD 512GB', 'images/product/laptop079.png', 0, 25199000, 0),
	('laptop080', '', 'model020', '14 G3 ACL', '', 'AMD Ryzen 7 5700U', '8GB DDR4 3200MHz', 'AMD Radeon Graphics', 'SSD 512GB', 'images/product/laptop080.png', 0, 19899000, 0),
    ('laptop081', '', 'model020', '14 G3 ACL', '', 'AMD Ryzen 5 5500U', '8GB DDR4 3200MHz', 'AMD Radeon Graphics', 'SSD 512GB', 'images/product/laptop081.png', 0, 17599000, 0),
    ('laptop082', '', 'model021', '3 15ITL6', '', 'Intel Core i5 1135G7', '8GB DDR4 3200MHz', 'Intel Iris Xe Graphics', 'SSD 512GB', 'images/product/laptop082.png', 0, 17999000, 0),
    ('laptop083', '', 'model021', '5 15ALC05', '', 'AMD Ryzen 7 5700U', '8GB DDR4 3200MHz', 'AMD Radeon Graphics', 'SSD 512GB', 'images/product/laptop083.png', 0, 18999000, 0),
    ('laptop084', '', 'model021', '3 14ITL6', '', 'Intel Core i5 1135G7', '8GB DDR4 3200MHz', 'Intel Iris Xe Graphics', 'SSD 512GB', 'images/product/laptop084.png', 0, 16999000, 0),
    ('laptop085', '', 'model021', '3 15ADA05', '', 'AMD Ryzen 5 3500U', '8GB DDR4 1400MHz', 'AMD Radeon Graphics', 'SSD 512GB', 'images/product/laptop085.png', 0, 14999000, 0),
	('laptop086', '', 'model022', 'Pro 7', '', 'Intel Core i5 1035G4', '8GB LPDDR4X 3733 MHz', 'Intel Iris Plus Graphics', 'SSD 128GB', 'images/product/laptop086.png', 0, 25999000, 0),
    ('laptop087', '', 'model022', 'Pro 7', '', 'Intel Core i5 1035G4', '8GB LPDDR4X 3733 MHz', 'Intel Iris Plus Graphics', 'SSD 256GB', 'images/product/laptop087.png', 0, 31999000, 0),
    ('laptop088', '', 'model022', 'Go', '', 'Intel Core i5 1035G1', '8GB LPDDR4X 3733 MHz', 'Intel UHD Graphics', 'SSD 128 GB', 'images/product/laptop088.png', 0, 19999000, 0),
	('laptop089', '', 'model023', 'GF65 Thin 10UE-228VN', '', 'Intel Core i7 10750H', '16GB DDR4 3200MHz', 'NVIDIA GeForce RTX 3060 6GB', 'SSD 512GB', 'images/product/laptop089.png', 0, 31990000, 0),
	('laptop090', '', 'model023', 'GF63 10SCXR-1218VN', '', 'Intel Core i5 10300H', '8GB DDR4 3200MHz', 'NVIDIA GeForce 6TX 1650 6GB', 'SSD 512GB', 'images/product/laptop090.png', 0, 20090000, 0),
	('laptop091', '', 'model024', 'GF66 11UC 641VN', '', 'Intel Core i7 11800H', '8GB DDR4 3200MHz', 'NVIDIA GeForce RTX 3050 4GB', 'SSD 512GB', 'images/product/laptop091.png', 0, 29090000, 0),
	('laptop092', '', 'model024', 'GF76 11UC 096VN', '', 'Intel Core i7 11800H', '8GB DDR4 3200MHz', 'NVIDIA GeForce RTX 3050 4GB', 'SSD 512GB', 'images/product/laptop092.png', 0, 30290000, 0),
	('laptop093', '', 'model025', 'Gaming 15M A11UEK-232VN', '', 'Intel Core i7 11370H', '16GB DDR4 3200MHz', 'NVIDIA GeForce RTX 3060 Max-Q 6GB', 'SSD 512GB', 'images/product/laptop093.png', 0, 40690000, 0);
	

select * from laptop;

-- set cost = 40% price .. :v bán cắt cổ vc
update laptop
set cost = price * 40 / 100;

-- random inventory
update laptop
set inventory = floor(10 + rand() * (50 - 10));

update laptop, model
set manufacture = model.manufacture_id
where laptop.model = model.model_id;

