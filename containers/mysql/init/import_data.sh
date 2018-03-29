cd /docker-entrypoint-initdb.d
# スペースを開けるとエラーになってしまうの
gzip -dc data.gz | mysql  -uusername -ppassword -P 13306 -D world