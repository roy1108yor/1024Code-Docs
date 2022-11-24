---
sidebar_position: 6
---


# 设置运行和编译命令

![设置运行和编译命令](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/editruncommand.png)

点击 IDE 运行按钮旁边的设置按钮，可以打开 Configure 窗口，对编译和运行命令以及运行是否包含图形输出（GUI）进行设置。

## 设置编译命令&运行命令

1、C/C++：https://zhuanlan.zhihu.com/p/342151242

2、Java：https://baike.baidu.com/item/javac/5156702?fr=aladdin

3、Python3 运行命令：python3 <源文件路径>

4、go：http://c.biancheng.net/view/6046.html

5、其他语言环境：略

## 设置运行是否包含图形输出（GUI）

包含图形输出（GUI）的程序需要选择勾选此开关，在运行前会先初始化 GUI 服务。默认不勾选，即运行前无需初始化 GUI 服务，以节省代码空间容器资源（每个代码空间默认分配1G大小的容器）。