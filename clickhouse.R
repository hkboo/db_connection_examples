library(RClickhouse)
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
con <-DBI::dbConnect(RClickhouse::clickhouse(),
                     host=host,
                     database=db_name,
                     user=user,
                     password=pwd,
                     port=port)

# get data
tbl_df <- DBI::dbGetQuery(con, "show tables")
print(tbl_df)

# disconnect
dbDisconnect(con)