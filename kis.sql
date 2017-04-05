IF  EXISTS (SELECT * FROM sys.objects WHERE name = 'kis_goods_read')
DROP PROCEDURE kis_goods_read
GO
CREATE PROCEDURE kis_goods_read
AS
BEGIN
    SELECT id, name FROM kis.dbo.goods 
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE name = 'kis_good_count_get')
DROP PROCEDURE kis_good_count_get
GO
CREATE PROCEDURE kis_good_count_get
	@Good_id int
AS
BEGIN
    SELECT SUM(volume) FROM kis.dbo.incgoods WHERE goods = @Good_id 
END
GO

SELECT * FROM kis.dbo.incgoods JOIN kis.dbo.income ON incgoods.id = income.id ORDER BY income.ddate


--SELECT incgoods.id, incgoods.subid, incgoods.volume, income.id
--FROM kis.dbo.incgoods INNER JOIN kis.dbo.income ON incgoods.id = income.id
--WHERE kis.dbo.incgoods.goods = '1' AND incgoods.volume > 0 AND kis.dbo.income.ddate = (SELECT MIN(ddate) FROM kis.dbo.income)

IF  EXISTS (SELECT * FROM sys.objects WHERE name = 'dbo.kis_read_maxcount')
DROP PROCEDURE dbo.kis_read_maxcount
GO
CREATE PROCEDURE dbo.kis_read_maxcount
    @Good_id int
AS
BEGIN
	SELECT TOP(1) kis.dbo.incgoods.volume 
	FROM kis.dbo.incgoods JOIN kis.dbo.income ON incgoods.id = income.id
	WHERE kis.dbo.incgoods.goods = @Good_id AND incgoods.volume > 0 ORDER BY kis.dbo.income.ddate
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE name = 'dbo.kis_delivery_record')
DROP PROCEDURE dbo.kis_delivery_record
GO
CREATE PROCEDURE dbo.kis_delivery_record
    @Good_id int,
	@vol int,
	@idrec int
AS
BEGIN
    DECLARE @id int
	SET @id = isnull((SELECT MAX(id) FROM kis.dbo.delivery), 0) + 1

	DECLARE @subid int
	SET @subid = isnull((SELECT MAX(subid) FROM kis.dbo.recgoods WHERE id = @idrec), 0) + 1
	
	INSERT INTO kis.dbo.recgoods (id, subid, goods, volume, price)
	VALUES(@idrec, @subid, @Good_id, @vol, 100)

	INSERT INTO kis.dbo.delivery (id, inc, incid, rec, recid, goods, volume)
	VALUES(@id,
	--inc, incid
	(	SELECT TOP(1) incgoods.id--, incgoods.subid--, incgoods.volume, income.id
		FROM kis.dbo.incgoods JOIN kis.dbo.income ON incgoods.id = income.id
		WHERE kis.dbo.incgoods.goods = @Good_id AND incgoods.volume > 0 ORDER BY kis.dbo.income.ddate
	),
	(	SELECT TOP(1) incgoods.subid--, incgoods.volume, income.id
		FROM kis.dbo.incgoods JOIN kis.dbo.income ON incgoods.id = income.id
		WHERE kis.dbo.incgoods.goods = @Good_id AND incgoods.volume > 0 ORDER BY kis.dbo.income.ddate
	),
	--rec, recid
	@idrec,
	@subid,
	@Good_id, @vol)
END
GO



CREATE TRIGGER trigger_upd_volume
ON kis.dbo.delivery AFTER INSERT
AS
BEGIN
	
	DECLARE @id int
	SET @id = isnull((SELECT MAX(id) FROM kis.dbo.delivery), 0)

	UPDATE kis.dbo.incgoods
	SET volume = (volume - (SELECT volume FROM kis.dbo.delivery WHERE id = @id))
	WHERE incgoods.id = (SELECT inc FROM kis.dbo.delivery WHERE id = @id) AND
			incgoods.subid = (SELECT incid FROM kis.dbo.delivery WHERE id = @id)
END
GO
