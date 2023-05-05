CREATE TRIGGER CheckOrderTotal
ON Orders
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @Threshold DECIMAL(10, 2);
    SET @Threshold = 10000; -- Example threshold value
    
    IF EXISTS (SELECT * FROM inserted WHERE orderTotal > @Threshold)
    BEGIN
        RAISERROR('Orders with a total above %s require additional approval.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
