library(rJava)
library(RJDBC)
library(DBI)

########################
## DB CONNECTION INFO ##
########################
drv <- JDBC(driverClass="com.mysql.jdbc.Driver",
            classPath="./mysql-connector-java-5.1.46.jar",identifier.quote="`")
host <- 'input_your_host'
user <- 'input_your_name'
pwd <- 'input_your_password'
db_name <- 'input_your_database'


########################
# CONNECT & DISCONNECT #
########################
# connect
con <- dbConnect(drv,
                 paste0(host, db_name,
                        '?useLegacyDatetimeCode=false&serverTimezone=Asia/Seoul',
                        '&useUnicode=true&characterEncoding=utf8'),
                 user, pwd)
dbSendQuery(con,'set names utf8')

# using query
query <- "show tables"
tbl_df <- dbGetQuery(con, query)
print(tbl_df)

# using sdk
m <- data.table::copy(mtcars)
m$car_type <- rownames(m)
rownames(m) <- NULL

# create & write together
dbWriteTable(con, 'mtcars', m)

# select data
mtcars_df <- dbReadTable(con, 'mtcars')
print(mtcars_df)

# disconnect
dbDisconnect(con)