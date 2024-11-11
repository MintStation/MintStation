
--
-- Table structure for table `whitelist`.
--
DROP TABLE IF EXISTS `whitelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ckey` varchar(32) NOT NULL,
	`manager` VARCHAR(32) NOT NULL,
	`manager_id` VARCHAR(32) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `last_modified` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ckey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `whitelist_log`.
--
DROP TABLE IF EXISTS `whitelist_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whitelist_log` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ckey` VARCHAR(32) NOT NULL,
	`manager` VARCHAR(32) NOT NULL,
	`manager_id` VARCHAR(32) NOT NULL,
  `action` ENUM('ADDED', 'REMOVED') NOT NULL DEFAULT 'ADDED',
  `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Trigger structure for trigger `log_whitelist_additions`.
--
DROP TRIGGER IF EXISTS `log_whitelist_additions`;
CREATE TRIGGER `log_whitelist_additions`
AFTER INSERT ON `whitelist`
FOR EACH ROW
INSERT INTO whitelist_log (ckey, manager, manager_id, `action`) VALUES (NEW.ckey, NEW.manager, NEW.manager_id, 'ADDED');


--
-- Trigger structure for trigger `log_whitelist_changes`.
--
DROP TRIGGER IF EXISTS `log_whitelist_changes`;
DELIMITER //
CREATE TRIGGER `log_whitelist_changes`
AFTER UPDATE ON `whitelist`
FOR EACH ROW
BEGIN
 IF NEW.deleted = 1 THEN
  INSERT INTO whitelist_log (ckey, manager, manager_id, `action`) VALUES (NEW.ckey, NEW.manager, NEW.manager_id, 'REMOVED');
 ELSE
  INSERT INTO whitelist_log (ckey, manager, manager_id, `action`) VALUES (NEW.ckey, NEW.manager, NEW.manager_id, 'ADDED');
 END IF;
END; //
DELIMITER ;
