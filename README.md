# Apache Hive and Iceberg

Small repository to test capabilities of Apache Hive 4 and Apache Iceberg.
Here you will find a small walkthrough to configure and use Hive to study Iceberg with HiveQL

## Confguration

Before, you must ensure that Docker and Dbeaver are installed. After that, you just need to run docker-compose.yml.

### 1. Install docker

Docker may be find on official [website](https://www.docker.com/).

### 2. Download Dbeaver 

Dbeaver is an awesome tool to connect and run SQL Queries on Hive and other databases. Download it [here](https://dbeaver.io/).

### 3. Downloading IBM Laundering Dataset.

Download data from [Kaggle](https://www.kaggle.com/datasets/ealtman2019/ibm-transactions-for-anti-money-laundering-aml?resource=download).

![dataset](assets/images/dataset-1.png?raw=true)

You can download either HI-Large_Trans.csv (~150m lines) or LI-Small_Trans.csv (~6m lines), both has the same schema but, with different row count. \
Create folders ```.\warehouse\landing\laundering\``` and move data to there.

### 4. Running Hive.

After docker installed, run the following code that will up some containers with hive, hive metastore and a postgres (metastore db).

```bash
docker-compose up -d
```

If everythings works fine:

![docker](assets/images/docker-status-1.png?raw=true)

## Dbeaver Connection and Running SQL

To connect dbeaver with hive, you just to configure port and ip, no needs any authentication.

![dbeaver](assets/images/dbeaver-conn-1.png?raw=true)

### Creating database

```sql
CREATE DATABASE db_landing;
```

### Creating Landing table

In order to create an external table to data use: (or ./scrips/landing.sql)

```sql
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
```

### Selecting Landing Table

```sql
SELECT * FROM db_landing.tbl_laundering LIMIT 1000;
```

![select1](assets/images/select-1.png?raw=true)

