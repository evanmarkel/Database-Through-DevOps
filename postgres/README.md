##  Postgres Configuation

# Data Source 
I've used a credit card database generated from <https://creditcardgenerator.com/>. I concatenated csvs of sample data (each size 1500)
to a csv of 50k. then using on bash $`for i in {1..1000}; do cat CC.csv >> CC_DB.csv; done` to create a repeated file of the 50k version that is 30gb in size and 300M lines. 

# Install Postgres on dedicated ec2 on us-east-1 VPC. 
