---
sidebar_position: 5
---


# 数据库

102Code 提供云端数据库资源供用户连接使用，暂时支持 Mysql 5.7 的创建和连接

>对PostgreSQL、MongoDB、Redis的支持正在排期中


## 创建

在 IDE 界面左侧导航栏点击资源管理模块图标，切换打开资源管理窗口。

![资源管理模块](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/assets/database.png)

在「添加数据库」区域点击 「MySQL」，向服务端发出创建请求：

![资源管理模块](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/%E5%88%9B%E5%BB%BAMySQL.png)


## 连接

创建成功后，点击MySQL打开详情查看 `MYSQL_HOST` 、`MYSQL_PASSWORD` 等环境变量信息，并使用其建立 MySQL 和代码空间的连接。

![资源管理模块](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/assets/mysql.png)

>云端数据库资源与代码空间绑定，代码空间需要保持激活状态，数据库才能正常使用。

### 在终端 Shell 里使用命令连接

![zaidaimalilianjie](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/assets/zaishelllilianjie.png)

### 在代码里使用环境变量连接

![zaidaimalilianjie](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/assets/zaidaimalilianjie.png)