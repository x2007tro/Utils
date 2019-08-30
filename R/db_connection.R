##
# Connect to mysql server
##
ConnMySql <- function(dbn){
  srv <- "192.168.2.200"
  prt <- 0000
  id <- "dspeast2"
  pwd <- "yuheng"
  
  conn <- DBI::dbConnect(drv = RMariaDB::MariaDB(),
                         user = id,
                         password = pwd,
                         dbname = dbn,
                         host = srv,
                         port = prt)
  return(conn)
}

##
# Connect to sql server - windows authentication
##
ConnSqlServer_WinAuth <- function(dbn){
  srv <- "192.168.2.120"
  
  conn <- DBI::dbConnect(drv = odbc::odbc(),
                         Driver = "ODBC Driver 17 for SQL Server",
                         Server = srv,
                         Database = dbn,
                         trusted_connection = "yes")
  return(conn)
}

##
# Connect to sql server - SQL authentication
##
ConnSqlServer_SQLAuth <- function(dbn){
  srv <- "192.168.2.120"
  id <- "dspeast2"
  pwd <- "yuheng"
  
  conn <- DBI::dbConnect(drv = odbc::odbc(),
                         Driver = "ODBC Driver 17 for SQL Server",
                         Server = srv,
                         Database = dbn,
                         UID = id,
                         PWD = pwd)
  return(conn)
}

##
# Connect to access database
# dbp : database path
##
ConnAccess <- function(dbp){
  
  conn <- DBI::dbConnect(drv = odbc::odbc(),
                         Driver = "Microsoft Access Driver (*.mdb, *.accdb)",
                         DBQ = dbp)
  return(conn)
}

##
# Data handling
##
##
# Read a table from sel server db
##
ReadDataFromSS <- function(db_obj, tbl_name){
  conn <- ConnMySql(db_obj) # conn can be SQL Server, MySql or Access database
  df <- DBI::dbReadTable(conn, tbl_name)
  DBI::dbDisconnect(conn)  
  return(df)
}

##
# Write a table to sql server db
##
WriteDataToSS <- function(db_obj, data, tbl_name, apd = FALSE){
  conn <- ConnMySql(db_obj)
  df <- DBI::dbWriteTable(conn, name = tbl_name, value = data,
                          append = apd, overwrite = !apd, row.names = FALSE)
  DBI::dbDisconnect(conn) 				  
  return(df)
}

##
# List all tables and queries
##
ListTblsFromSS <- function(db_obj){
  conn <- ConnMySql(db_obj)
  dfs_tn <- DBI::dbListTables(conn, scheme = "dbo")
  DBI::dbDisconnect(conn)
  return(dfs_tn)
}

##
# Send query to db
##
GetQueryResFromSS <- function(db_obj, qry_str){
  conn <- ConnMySql(db_obj)
  qry_conn <- DBI::dbSendQuery(conn, qry_str)
  res <- DBI::dbFetch(qry_conn)
  DBI::dbClearResult(qry_conn)
  DBI::dbDisconnect(conn)
  return(res)
}