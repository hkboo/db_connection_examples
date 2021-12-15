library(mongolite)

########################
## DB CONNECTION INFO ##
########################
db_url <- "mongodb://localhost:27017"
collection <- 'input_your_collection'
db_name <- 'input_your_database'


########################
# CONNECT & DISCONNECT #
########################
# connect
col_con <- mongo(
    collection = collection,
    db = db_name,
    url = db_url,
    verbose = FALSE,
    options = ssl_options()
)

# get data
data <- col_con$find()
print(data)

# disconnect
rm(col_con)