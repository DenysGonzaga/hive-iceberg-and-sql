CREATE DATABASE db_landing;

CREATE EXTERNAL TABLE IF NOT EXISTS db_landing.tbl_laundering (
	`dt_event`           STRING COMMENT 'Timestamp',
	`from_bank`          STRING COMMENT 'From Bank',
	`account1`           STRING COMMENT 'Account',
	`to_bank`            STRING COMMENT 'To Bank',
	`account2`           STRING COMMENT 'Account2',
	`amount_received`    STRING COMMENT 'Amount Received',
	`receiving_currency` STRING COMMENT 'Receiving Currency',
	`amount_paid`        STRING COMMENT 'Amount Paid',
	`payment_currency`   STRING COMMENT 'Payment Currency',
	`payment_format`     STRING COMMENT 'Payment Format',
	`is_laundering`      STRING COMMENT 'Is Laundering'
)
 COMMENT 'Landing Laundering Table'
 ROW FORMAT DELIMITED
 FIELDS TERMINATED BY ','
 LOCATION '/opt/hive/data/warehouse/landing/laundering/'
 TBLPROPERTIES ("skip.header.line.count"="1");