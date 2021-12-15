library(RPostgreSQL)
library(DBI)

########################
## DB CONNECTION INFO ##
########################
host <- 'input_your_host'
user <- 'input_your_name'
pwd <- 'input_your_password'
db_name <- 'input_your_database'
port <- 'input_your_port'


########################
# CONNECT & DISCONNECT #
########################
# connect
con <- dbConnect(
    dbDriver("PostgreSQL"),
    host=host,
    dbname=db_name,
    user=user,
    password=pwd,
    port=port
)

# get data
query1 <- "SELECT * FROM information_schema.columns"
cols_df <- dbGetQuery(con, query1)
print(cols_df)

query2 <- "SELECT datname FROM pg_database;"
db_name_df <- dbGetQuery(con, query2)
print(db_name_df)

# disconnect
dbDisconnect(con)