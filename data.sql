INSERT INTO kis.dbo.region(id, name)
VALUES(1, 'Московская область')
GO

INSERT INTO kis.dbo.city(id, name, region)
VALUES(1, 'Москва', 1)
GO

INSERT INTO kis.dbo.clients(id, name, adress, city)
VALUES(1, 'Клиент 1', 'Адрес 1', 1)
GO

INSERT INTO kis.dbo.storages(id, name)
VALUES(1, 'Склад 1')
GO

INSERT INTO kis.dbo.income(id, ddate, ndoc, storage, client)
VALUES(1, '2017-03-19T00:00:00.00', 15, 1, 1)
GO
INSERT INTO kis.dbo.income(id, ddate, ndoc, storage, client)
VALUES(2, '2017-03-24T00:00:00.00', 16, 1, 1)
GO
INSERT INTO kis.dbo.income(id, ddate, ndoc, storage, client)
VALUES(3, '2017-04-04T00:00:00.00', 17, 1, 1)
GO

INSERT INTO kis.dbo.goods_groups(id, name)
VALUES(1, 'Группа 1')
GO

INSERT INTO kis.dbo.goods(id, g_group, name, weight, length, height, width)
VALUES(1, 1, 'Товар 1', 150, 10, 10, 10)
GO
INSERT INTO kis.dbo.goods(id, g_group, name, weight, length, height, width)
VALUES(2, 1, 'Товар 2', 50, 15, 15, 15)
GO

INSERT INTO kis.dbo.incgoods(id, subid, goods, volume, price)
VALUES(1, 1, 1, 0, 1000)
GO
INSERT INTO kis.dbo.incgoods(id, subid, goods, volume, price)
VALUES(2, 1, 1, 15, 1500)
GO
INSERT INTO kis.dbo.incgoods(id, subid, goods, volume, price)
VALUES(3, 1, 1, 10, 1000)
GO
INSERT INTO kis.dbo.incgoods(id, subid, goods, volume, price)
VALUES(3, 2, 2, 10, 10000)
GO

INSERT INTO kis.dbo.recept(id, ddate, ndoc, client, storage)
VALUES(1, '2017-03-22T00:00:00.00', 15, 1, 1)
GO