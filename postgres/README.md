#  Postgres Configuation

## Data Source 
I've used a credit card database generated from <https://creditcardgenerator.com/>. I concatenated csvs of sample data (each with 1500 lines)
to a csv of 50k lines. then using bash: $`for i in {1..1000}; do cat CC.csv >> CC_DB.csv; done` iteratively writes to the 50k file that that blows it up to 30gb in size and ~300M lines to have a performance comparison between Postgres and Cockroach. 

## Install Postgres on dedicated ec2 on us-east-1 VPC. 
Run the bash script $`bash install_postgres.sh` to install Postgres and dump the database in VPC for migration to cockroach. 