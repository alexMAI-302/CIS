CREATE TABLE region(
	id		int NOT NULL,
	name	varchar(255) NOT NULL,
	PRIMARY KEY (id)
)
GO

CREATE TABLE city(
	id		int NOT NULL,
	name	varchar(255) NOT NULL,
	region	int NOT NULL,
	PRIMARY KEY (id)
)
GO

CREATE TABLE bank_income(
	id		int NOT NULL,
	ddate	datetime NOT NULL,
	summ	money NOT NULL,
	client	int NOT NULL,
	PRIMARY KEY (id)
)
GO

CREATE TABLE cassa_income(
	id		int NOT NULL,
	ddate	datetime NOT NULL,
	summ	money NOT NULL,
	client	int NOT NULL,
	PRIMARY KEY (id)
)
GO

CREATE TABLE bank_recept(
	id		int NOT NULL,
	ddate	datetime NOT NULL,
	summ	money NOT NULL,
	client	int NOT NULL,
	PRIMARY KEY (id)
)
GO

CREATE TABLE cassa_recept(
	id		int NOT NULL,
	ddate	datetime NOT NULL,
	summ	money NOT NULL,
	client	int NOT NULL,
	PRIMARY KEY (id)
)
GO

CREATE TABLE clients(
	id		int NOT NULL,
	name 	varchar(30) NULL,
	adress	varchar(255) NOT NULL,
	city	int NOT NULL,
	PRIMARY KEY (id)
)
GO

CREATE TABLE goods_groups(
	id		int NOT NULL,
	name	varchar(50) NOT NULL,
	parent	int NULL,
	PRIMARY KEY (id)
)
GO

CREATE TABLE goods(
	id		int NOT NULL,
	g_group	int NOT NULL,
	name	varchar(50) NOT NULL,
	weight	int NULL,
	length	int NULL,
	height	int NULL,
	width	int NULL,
	PRIMARY KEY (id)
)
GO

CREATE TABLE storages(
	id		int NOT NULL,
	name	varchar(30) NOT NULL,
	PRIMARY KEY (id)
)
GO

CREATE TABLE income(
	id		int NOT NULL,
	ddate	datetime NOT NULL,
	ndoc	int NOT NULL,
	storage	int NOT NULL,
	client	int NOT NULL,
	PRIMARY KEY (id)
)
GO

CREATE TABLE recept(
	id		int NOT NULL,
	ddate	datetime NOT NULL,
	ndoc	int NOT NULL,
	client	int NOT NULL,
	storage	int NOT NULL,
	PRIMARY KEY (id)
)
GO

CREATE TABLE incgoods(
	id		int NOT NULL,
	subid	int NOT NULL,
	goods	int NOT NULL,
	volume	int NOT NULL,
	price	money NOT NULL,
	PRIMARY KEY (id, subid)
)
GO

CREATE TABLE recgoods(
	id		int NOT NULL,
	subid	int NOT NULL,
	goods	int NOT NULL,
	volume	int NOT NULL,
	price	money NOT NULL,
	PRIMARY KEY (id, subid)
)
GO

CREATE TABLE delivery(
	id		int NOT NULL,
	inc		int NOT NULL,
	incid	int NOT NULL,
	rec		int NOT NULL,
	recid	int NOT NULL,
	goods	int NOT NULL,
	volume	int NOT NULL,
	PRIMARY KEY (id)
)
GO

ALTER TABLE city
       ADD FOREIGN KEY (region)
                             REFERENCES region
GO

ALTER TABLE clients
       ADD FOREIGN KEY (city)
                             REFERENCES city
GO

ALTER TABLE bank_income
       ADD FOREIGN KEY (client)
                             REFERENCES clients
GO

ALTER TABLE cassa_income
       ADD FOREIGN KEY (client)
                             REFERENCES clients
GO

ALTER TABLE bank_recept
       ADD FOREIGN KEY (client)
                             REFERENCES clients
GO

ALTER TABLE cassa_recept
       ADD FOREIGN KEY (client)
                             REFERENCES clients
GO

ALTER TABLE goods_groups
       ADD FOREIGN KEY (parent)
                             REFERENCES goods_groups
GO

ALTER TABLE goods
       ADD FOREIGN KEY (g_group)
                             REFERENCES goods_groups
GO

ALTER TABLE income
       ADD FOREIGN KEY (storage)
                             REFERENCES storages
GO

ALTER TABLE income
       ADD FOREIGN KEY (client)
                             REFERENCES clients
GO

ALTER TABLE recept
       ADD FOREIGN KEY (client)
                             REFERENCES clients
GO

ALTER TABLE recept
       ADD FOREIGN KEY (storage)
                             REFERENCES storages
GO

ALTER TABLE incgoods
       ADD FOREIGN KEY (id)
                             REFERENCES income
GO

ALTER TABLE incgoods
       ADD FOREIGN KEY (goods)
                             REFERENCES goods
GO

ALTER TABLE recgoods
       ADD FOREIGN KEY (id)
                             REFERENCES income
GO

ALTER TABLE recgoods
       ADD FOREIGN KEY (goods)
                             REFERENCES goods
GO

ALTER TABLE delivery
       ADD FOREIGN KEY (inc, incid)
                             REFERENCES incgoods
GO

ALTER TABLE delivery
       ADD FOREIGN KEY (rec, recid)
                             REFERENCES recgoods
GO

ALTER TABLE delivery
       ADD FOREIGN KEY (goods)
                             REFERENCES goods
GO






