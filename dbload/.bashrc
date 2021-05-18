...
function dbload() {

    if [ -z "$1" ]; then
        echo "Usage: dbload <dump.sql.gz> <database-name>"
        return 1
    fi

    if [ -z "$2" ]; then
        echo "Usage: <dbload dump.sql.gz> <database-name>"
        return 1
    fi

    if [ ! -f "$1" ]; then
        echo "Err: File $1 doesn't exists or can not be found"
        return 1
    fi

    DB_EXISTS=`mysqlshow --user=mysql --password=mysql "$2" 2>/dev/null | grep -v Wildcard | grep -o "$2"`
    if [ "$DB_EXISTS" != "$2" ]; then
        echo "Err: Database $2 doesn't exists"
        return 1
    fi


    pv "$1" | gunzip | mysql -umysql -pmysql "$2"
}
