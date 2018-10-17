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