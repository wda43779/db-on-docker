# 在 Docker 中运行开发数据库

## Postgre 数据库

启动
```
make postgres
```

连接 shell
```
make psql
```

管理
```
\l --列出数据库
\c <name> --连接数据库
\dt --列出数据库中的表
\d+ <table> -- 查看表的列
\q --退出
```
