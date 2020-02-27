# CockroachDB Configuration files

### Configure Stateful Set from config files
$ `kubectl create -f cockroachdb-statefulset.yaml`

### Initialize cockroach cluster 
$ `kubectl create cluster-init.yaml`


## Run Cockroach SQL client and migrate Postgres pg_dump

### Launch pod with SQL client
`kubectl run cockroachdb -it --image=cockroachdb/cockroach:v19.2.4 --rm --restart=Never -- sql --insecure --host=cockroachdb-public`

### Migrate DB
> `IMPORT PGDUMP 's3://ccdbpostgresdump/ccdb.sql?AWS_ACCESS_KEY_ID=<enter_your_id>&AWS_SECRET_ACCESS_KEY=<enter_your_secret_key>';`

### Exit and delete temp pod

< `\q`
