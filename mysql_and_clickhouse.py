import clickhouse_driver
import pymysql
import pandas as pd


# Connection
def get_connection(driver_doc, db_type=['mysql', 'clickhouse']):
    conn = None
    if db_type == 'mysql':
        conn = pymysql.connect(**driver_doc)
    elif db_type == 'clickhouse':
        conn = clickhouse_driver.connect(**driver_doc)
    else:
        print("check your db type")
    
    print("connected")
    return conn

# disconnect
def close_connection(cursor, conn):
    cursor.close()
    conn.close()
    return print("closed")


########################
## DB CONNECTION INFO ##
########################
ch_doc = {
    "host": "Input_your_host",
    "database": "Input_your_db_name",
    "user": "Input_your_user_name",
    "password": "Input_your_password",
    "port": int("Input_your_port")
}

mysql_doc = {
    "host": "Input_your_host",
    "database": "Input_your_db_name",
    "user": "Input_your_user_name",
    "password": "Input_your_password",
    "port": int("Input_your_port"),
    'charset':'utf8'
}

########################
# CONNECT & DISCONNECT #
########################
# Clickhouse
ch_conn = get_connection(ch_doc, 'clickhouse')
ch_cursor = ch_conn.cursor()
ch_cursor.execute("show tables")
tbl_df1 = pd.DataFrame(ch_cursor.fetchall())
print(tbl_df1)
close_connection(ch_cursor, ch_conn)


# mysql
my_conn = get_connection(mysql_doc, 'mysql')
my_cursor = my_conn.cursor()
my_cursor.execute("show tables")
tbl_df2 = pd.DataFrame(my_cursor.fetchall())
print(tbl_df2)
close_connection(my_cursor, my_conn)