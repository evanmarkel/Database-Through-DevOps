#!/Database-Through-Devops/postgres bash

# Install postgres on ubuntu
sudo apt update
sudo apt install postgresql postgresql-contrib

# Verify installation  with psql command
sudo -u postgres psql -c "SELECT version();" = $1 | echo $1

# Create user and create database for data migration
sudo su - postgres -c "createuser dbwrangle"
sudo su - postgres -c "createdb dbwrangledb"

# Grant priveleges
sudo -u postgres psql
grant all privileges on database dbwrangledb to dbwrangle;

# Import database from CSV file. 
psql 
CREATE TABLE dbwrangledb(IssuingNetwork VARCHAR, CardNumber VARCHAR, Pin INTEGER, Cvv INTEGER, SpendLimit BIGINT, ExpirationMonth INTEGER, ExpirationYear INTEGER, Name VARCHAR, Address VARCHAR, Country VARCHAR, Empty VARCHAR);
COPY dbwrangledb(IssuingNetwork, CardNumber, Pin, Cvv, SpendLimit, ExpirationMonth, ExpirationYear, Name, Address, Country, Empty) FROM 'https://ccdbpostgresdump.s3.amazonaws.com/ccdb.sql' DELIMITER ',' CSV HEADER;

# PG Dump for migration to cockroach
pg_dump dba > ccdblong.sql