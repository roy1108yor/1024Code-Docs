---
sidebar_position: 0
---

# 编写并运行 C++ 程序

在 1024Code 我们可以选择预先安装好相应的环境(依赖)的模版和模版版本。拿 C++ 举例，我们分别支持了三个不同版本的模板：

- GCC：C/C++ 的编译器套件
- Clang：Clang 编译器，Clang 对语法的要求是最严格的，因此在 Clang 能编译通过的代码，在 GCC 上一般都能编译成功
- GUI：图形输出，支持使用图形库渲染图形内容，已装好 SDL、QT 图形库

可以按需选择模板版本，创建并打开代码空间。

![使用模版创建代码空间](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/%E4%BD%BF%E7%94%A8%E6%A8%A1%E6%9D%BF.png)


## 运行 Demo 程序

点击 `运行按钮` 执行预先设置好的 `（编译和）运行命令` ，将 `Demo程序` 运行起来

![运行](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/5401666077814_.pic.jpg)


## 编写你自己的程序

例如，我们编写一个职工管理系统，可以在1024Code直接编写或者选择将之前的本地文件直接上传。

### 直接编写

- 编辑 main.cpp 文件
  
  ![编辑 main.cpp](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/editmaincpp.png)
  
- 在文件树窗口创建头文件

  ![创建头文件](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/%E5%88%9B%E5%BB%BA%E5%A4%B4%E6%96%87%E4%BB%B6.png)

  ![查看头文件](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/%E6%9F%A5%E7%9C%8B%E5%A4%B4%E6%96%87%E4%BB%B6.png)


### 上传本地文件

- 在文件树窗口右上角的更多按钮点击`上传文件夹`按钮上传本地文件
  
  ![上传本地文件](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/gif-04.gif)

- 或者直接拖拽文件/文件夹到文件树窗口

  ![拖拽上传](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/gif-02.gif)

- 其它上传方式见：https://docs.1024code.com/common_problem/uploadfile

- 在 shell 里使用 `cd` 和 `mv` 命令将文件夹里的文件移动到根目录下

  ![将文件夹里的文件移动到根目录下](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/WX20221018-165224%402x.png)
  
  
## 包管理

对于一个实际的`C/C++`项目而言，源文件一般不会只有一个，而且绝大多数情况下会使用到第三方库。 

由于`C/C++`没有官方的包管理工具（Package Manager），比如`Python`会有`pip`包管理工具，`Java`有`maven`，`Nodejs`有`npm`等等， 所以，在`C/C++`项目中使用第三方库时，一般使用系统自带的包管理器来进行第三方库的安装（1024Code 使用`nix`预置了基础第三方库）。

而对于系统包管理器未收纳的第三方库，我们一般会选择自行编译安装，或者将其作为子项目共同编译。第三方库主要由两个部分组成，即头文件和库文件。 

## 设置编译和运行命令

`GCC工具链`不负责管理第三方库，因此无法判定`C/C++`项目具体需要使用哪些库，以及这些库的准确信息，如位置、版本等。 所以，仅使用`GCC`，无法完全自动地解决`C/C++`项目第三方库的依赖问题（即无法像`Python`、`Java`等语言，仅需要使用`import` `xxx语句`导入相应的包，包管理器能够自动地解决第三方库的依赖关系）。 

`C/C++`语言在使用 `#include "xxx"` 语句后，我们还需要人工地添加各种编译参数，如-I，-l以及-L，将所依赖的第三方库的相关信息，传递给`gcc编译器`。

[更多关于C/C++项目包管理及编译信息，可点击此处了解](https://zhuanlan.zhihu.com/p/342151242)


对以上内容有了一定了解后，我们可以在隐藏的.1024文件里设置编译命令和运行命令。

![显示隐藏文件](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/5421666083446_.pic.jpg)

![查看.1024文件](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/5431666083541_.pic.jpg)

将预设的编译命令（compile_command）由 "make -s" 改成 "make all"，因为项目涉及了多个 `.cpp` 文件需要编译。 

![修改编译命令后运行](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/gif-03.gif)

修改后，重新运行。恭喜！你已经在 1024Code 上编辑并运行起来了你的第一个有用的程序。

## 和控制台交互

![和控制台交互](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/gif-05.gif)

点击控制台（console）窗口后，可以使用键盘在光标处输入相关内容和控制台进行交互。

## 邀请他人和你一起协作编程

在 IDE 界面的右上角，点击协作按钮，可以通过输入用户名称、手机号码、邮箱搜索到对方，并向对方发出协作邀请。

![邀请](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/%E9%82%80%E8%AF%B7.png)

对方加入后，可在同一个代码空间页面中实时协作编写和调试代码。

![协作演示](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/gif-06-2.gif)

## 与别人分享你的项目

同样，在 IDE 界面的右上角，点击分享按钮，我们可以分享代码空间给其他人。

![分享](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/%E5%88%86%E4%BA%AB.png)

可以选择：
- 复制链接分享代码空间分享页
- 仅分享 IDE环境
- 微信扫码分享
- Embed 分享
- 分享到 1024Code 社区

分享出去的代码空间是代码文件和运行环境的集合，可直接运行，无需下载安装和配置环境。

![分享打开](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/gif-01.gif)



