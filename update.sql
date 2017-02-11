ALTER TABLE `Department` ADD `ClusterID` INT(11) NOT NULL AFTER `Intake`;
UPDATE `Department` SET `ClusterID` = 1 WHERE DepartmentID = 1;
UPDATE `Department` SET `ClusterID` = 2 WHERE DepartmentID = 2 OR DepartmentID = 3;
UPDATE `Department` SET `ClusterID`=3 ,`Name`= 'ME' WHERE DepartmentID = 4;
