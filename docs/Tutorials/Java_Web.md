---
sidebar_position: 1
---

# 编写并运行 Java Web 项目

## 下载安装 Tomcat

在 shell 里使用 wget 命令从 apache 官网下载并 Tomcat zip 包

```
$ wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.83/bin/apache-tomcat-8.5.83.zip
```

解压 Tomcat zip 包

```
$ unzip apache-tomcat-8.5.83.zip 
```

![下载安装Tomcat](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/%E6%95%99%E7%A8%8B/%E4%B8%8B%E8%BD%BD%E5%AE%89%E8%A3%85Tomcat.png)

## 创建或上传项目文件

> 创建/上传使用 maven 管理的 Java Web 项目

在 JavaWeb 开发中，往往需要使用大量的 jar 包，如果没有 maven 我们需要手动去导入，反之 maven 可以方便 jar 包的导入和管理。

注意：普通 Java Web 项目 不能直接转换成用 maven 管理的 Java Web 项目，因为其项目目录不同。

![项目目录对比](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/%E6%95%99%E7%A8%8B/%E7%9B%AE%E5%BD%95%E5%AF%B9%E6%AF%94.png)

点击 [此处](https://www.cnblogs.com/chachan53/p/16416126.html#5-maven) 了解更多有关 Java Web 和 Maven的介绍内容。

### 手动创建

- 按照目录结构创建文件夹及文件
  
  ![按照目录结构创建文件夹及文件](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/%E6%95%99%E7%A8%8B/%E5%88%9B%E5%BB%BA%E9%A1%B9%E7%9B%AE%E7%9B%AE%E5%BD%95.png)
  
- 创建 pom.xml 文件（ maven 通过读取 pom.xml 文件来管理项目依赖）

  在 shell 里使用 mv 命令创建 pom.xml 文件（[点击阅读官方文档了解](https://maven.apache.org/guides/getting-started/index.html#How_do_I_make_my_first_Maven_project)）：
  
  ```
  $ mvn -B archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4
  ```
  （其中 my-app 改成自己项目的名称）

  ![创建 pom.xml 文件](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/%E6%95%99%E7%A8%8B/%E7%BC%96%E8%BE%91pom.xml%E6%96%87%E4%BB%B6.png)
  

### 上传项目文件

![上传项目文件](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/%E6%95%99%E7%A8%8B/01.gif)

## 使用 Mysql 数据库

### 在资源管理模块添加 Mysql 数据库

![添加 Mysql 数据库中间件](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/%E6%95%99%E7%A8%8B/02.gif)

### 初始化数据库

```
# 在shell中连接数据库，<host> 、<port> 和密码在资源（数据库）管理面板查看
# ex: mysql -h 172.16.32.18 -P 57983 -u root -p
---
$ mysql -h <host> -P <port> -u root -p
$ mysql> create database 数据库名;     # 创建数据库
$ mysql> use 数据库名;       # 使用已创建的数据库 
$ mysql> set names utf8;      # 设置编码
$ mysql> source /home/runner/app/student-system/script/student-system.sql # 导入备份数据库初始化数据库
$ mysql> quit    # 退出数据库
```
![初始化数据库](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/%E6%95%99%E7%A8%8B/%E5%88%9D%E5%A7%8B%E5%8C%96%E6%95%B0%E6%8D%AE%E5%BA%93.png)

### 在项目文件里进行数据库连接设置

![添加使用数据库环境变量连接数据库的方法](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/%E6%95%99%E7%A8%8B/%E7%8E%AF%E5%A2%83%E5%8F%98%E9%87%8F%E8%BF%9E%E6%8E%A5%E6%95%B0%E6%8D%AE%E5%BA%93%E6%96%B9%E6%B3%95.png)

添加使用数据库环境变量连接数据库的方法。

## 编译

在 shell 里执行以下命令编译项目：

```
$ cd student-system
$ mvn install
$ mvn compile
```
![mvn compile](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/%E6%95%99%E7%A8%8B/07.gif)

maven 常用命令：
- 清除项目依赖：mvn clean
- 安装项目依赖：mvn install
- 清除并重新下载项目依赖：mvn clean install -U
- 查看项目依赖树：mvn dependency:tree
- 编译：mvn compile
- 打包：mvn package

## 打包

```
$ mvn package
```

![mvn package](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/%E6%95%99%E7%A8%8B/06.gif)

打包好的 war 包可以在项目文件夹下载 target 文件夹（隐藏文件夹）下找到。

## 将项目发布到 Tomcat

将项目生成的 war 包，移动至 Tomcat 的 webapps 文件夹下 

```
$ cd target
$ mv student-system.war ../../apache-tomcat-8.5.83/webapps/
```
![移动war包](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/%E6%95%99%E7%A8%8B/04.gif)

发布完成了。

## 运行项目

### 修改运行命令

在文件树右上角的更多菜单里点击显示隐藏文件，找到 `.1024文件` 进行修改

![修改运行命令](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/%E6%95%99%E7%A8%8B/03.gif)

### 授予打开.sh文件权限

在 shell 里执行以下命令授予 IDE 打开.sh文件权限：

```
$ cd ~/app
$ chmod 755 apache-tomcat-8.5.83/bin/*.sh
```

### 运行并访问项目

点击运行按钮运行项目，运行起来后，在浏览器窗口里点击新标签页打开，在地址栏URL中添加项目名称尾缀访问项目

![运行并访问项目](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/%E6%95%99%E7%A8%8B/05-1.gif)