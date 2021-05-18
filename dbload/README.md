### Usage

Append this function to your ~/.bashrc and apply it if needed for current terminal session
```
$ . ~/.bashrc
```

Then you can triger dump upload as next
```
$ dbload <dump.sql.gz> <database>
```

Underhood the script checks the existence of the dump file and the database. In case if both exist it runs the next command
```
pv <dump.sql.gz> | gunzip | mysql -umysql -pmysql <database>
```
