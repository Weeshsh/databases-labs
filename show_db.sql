USE bd_laby; -- Replace with your database name

DECLARE @TableName NVARCHAR(MAX);
DECLARE @SQL NVARCHAR(MAX);

-- Cursor to iterate through all tables
DECLARE table_cursor CURSOR FOR
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_SCHEMA = 'dbo'; -- Adjust schema if needed

OPEN table_cursor;

FETCH NEXT FROM table_cursor INTO @TableName;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Generate a dynamic SELECT query for each table
    SET @SQL = 'SELECT * FROM ' + QUOTENAME(@TableName);
    
    PRINT '--- Data from Table: ' + @TableName + ' ---';
    EXEC(@SQL); -- Execute the generated query

    FETCH NEXT FROM table_cursor INTO @TableName;
END

CLOSE table_cursor;
DEALLOCATE table_cursor;
