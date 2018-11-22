# 简单的网址缩短程序
## 网站示例
![demo](https://img03.sogoucdn.com/app/a/100520146/5d094eb3ab03c9f79b9fa06392b1930d)
- Web环境：Apache2.4（需开启网址重写）
- 数据库：Mysql

## 安装方法
1. 下载源码到电脑，修改config.php中的域名和数据库配置

![Snipaste_2018-07-24_23-46-57.png](https://img01.sogoucdn.com/app/a/100520146/a5b31bf131ba9835c685051e19be8501)

2. 使用phpmyadmin或Navicat Premium执行源码中的dwz_url.sql，成功后数据库结构如下，其中md5为索引

![Snipaste_2018-07-24_23-24-50.png](https://img04.sogoucdn.com/app/a/100520146/021bab663143e2f098712b8410b2b83b)

3. 将源码上传至网页根目录即可访问

## 部分说明
- Web服务器(Apache)需开启网址重写并上传.htaccess文件到服务器，Nginx请自行转换(因为我不怎么用不会)
- 缩短规则为【http(s)://网址/网址的十六位md5】
- 重写规则访问【http(s)://网址/md5】实际访问【http(s)://网址/index.php?m=md5】
- 数据库md5字段设置为索引(sql文件中已经设置)，保证大量数据时查询速度
- 输入网址会做正则校验，目前仅支持 http:// 或 https:// 开头
- 数据库操作已做预处理，防止SQL注入

## 本程序写的比较仓促，仅为实现基础功能，无后台，如有改进建议欢迎提出。
