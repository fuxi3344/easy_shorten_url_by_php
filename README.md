## 程序说明
- 输入网址会做正则校验，目前仅支持 http:// 或 https:// 开头
- 数据库操作已做预处理，防止SQL注入
- 数据库添加id索引，大量数据时查询更快
- 添加了Memcached缓存支持，可按需开启，减少数据库压力
- 短网址规则更改为36进制自动增加，避免md5重复的问题

# 网站示例
![](https://ws1.sinaimg.cn/large/cf6ca285gy1g0t44upwu4j20n00g4wet.jpg)
- Web环境：Apache或Nginx
- 数据库：Mysql
- 缓存：Memcached

**如对性能要求较高可使用Nginx-Tengine和MariaDB并开启Memcached缓存**

# 安装方法
## Web服务器

1. 修改config.php中的配置文件中的数据库信息和Memcached缓存信息(如需开启缓存)
![](https://ws1.sinaimg.cn/large/cf6ca285gy1g0t45148w9j213109bmyd.jpg)

2. 上传index.php和config.php到网站目录，并开启网址重写

### 关于网址重写

重写方法：http://demo.com/123 -> http://demo.com/index.php?m=123

**Apache**：直接上传.htaccess到根目录可开启

.htaccess内容如下

```
RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule  ^([a-zA-Z0-9]*)(/?)$ index.php?m=$1 [L]
```

**Nginx：** 将.htaccess转换后填写到Nginx配置文件中

参考规则

```
if (!-d $request_filename){
 set $rule_0 1$rule_0;
 }
 if (!-f $request_filename){
 set $rule_0 2$rule_0;
 }
 if ($rule_0 = "21"){
 rewrite ^/(.*)$ /index.php/?m=$1 last;
 }
```

或者自己找转换工具。eg.[http://winginx.com/en/htaccess/](http://winginx.com/en/htaccess/)


## 数据库
使用phpmyadmin或Navicat Premium导入执行源码中的dwz_url.sql，成功后数据库结构如下，其中id为索引

![](https://ws1.sinaimg.cn/large/cf6ca285gy1g0t456ecnnj20e802ot8l.jpg)


## 完成！GLHF!
