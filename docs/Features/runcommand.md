---
sidebar_position: 7
---


# 设置运行和编译命令

![设置运行和编译命令](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/editruncommand.png)

点击 IDE 运行按钮旁边的设置按钮，可以打开 Configure 窗口，对编译和运行命令以及运行是否包含图形输出（GUI）进行设置。

## 设置编译命令&运行命令

1、C/C++：https://zhuanlan.zhihu.com/p/342151242

2、Java：https://baike.baidu.com/item/javac/5156702?fr=aladdin

3、go：http://c.biancheng.net/view/6046.html

4、Python3 运行命令：python3 <源文件路径>

5、其他语言环境：略

## 设置运行是否包含图形输出（GUI）

包含图形输出（GUI）的程序需要选择勾选此开关，在运行前会先初始化 GUI 服务。默认不勾选，即运行前无需初始化 GUI 服务。


## 在配置文件中手动修改配置

![shoudongxiugai1024](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/assets/shoudongxiugai1024.png)

点击文件树里的更多操作按钮，点击“显示隐藏文件”，可以文件树中查看到隐藏的`.1024`文件，点击该文件在编辑器内打开，直接对文件内的如下参数进行修改：
```json
compile_command: "此处填写项目编译命令"
run_command: "此处填写项目运行命令"
gui: 此处填写`true`/`false`
```
注意：文件中的其他参数请谨慎修改，如debug相关配置参数、lsp代码补全服务相关参数，修改实物可能会对其他功能产生影响。