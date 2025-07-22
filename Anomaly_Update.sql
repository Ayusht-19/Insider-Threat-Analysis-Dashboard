select * from system

UPDATE System
SET AnomalyScore = AnomalyScore + 5  -- Add 5 to the existing score
WHERE (FileType = 'Database' OR FileType = 'Spreadsheet')  -- Sensitive file types
  AND CAST(Timestamp AS TIME) NOT BETWEEN '09:00:00' AND '17:00:00'; -- Outside working hours

UPDATE System
SET AnomalyScore = AnomalyScore + 3  -- Add 3
WHERE DataTransferred > 1000000;  -- 1MB threshold

-- Add an index on EmployeeID and Timestamp
CREATE INDEX idx_employee_timestamp ON System (EmployeeID, Timestamp);

UPDATE System
SET AnomalyScore = AnomalyScore + 2
WHERE EXISTS (
    SELECT 1
    FROM (
        SELECT
            EmployeeID,
            Timestamp,
            COUNT(*) OVER (PARTITION BY EmployeeID ORDER BY Timestamp RANGE BETWEEN INTERVAL '1 hour' PRECEDING AND CURRENT ROW) as activity_count
        FROM System
    ) AS subquery
    WHERE activity_count > 2
);

