---
sidebar_position: 4
---

# Git 版本管理

**1024Code** 支持使用 Git 的源代码管理功能对代码及代码版本进行管理。

![git模块](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/assets/791679415742_.pic.jpg)
## 分支

* 代码空间创建后会给代码空间默认生成 `master` 分支
* 支持在 `shell` 里创建和切换分支
  * 分支在创建后，每个分支独立
## 更改

以文件为维度，自动对比当前分支上一次提交的版本，判断文件是否有更改（包括新增文件），将有更改的文件实时记录下来。

* 更改标记：记录更改文件的同时按照更新性质给文件分别打上以下标记：
  - M：文件有改动
  - U：新创建的文件
  - D：删除的文件
* U 和 D 标记的文件，支持点击后在编辑器里打开查看

## Commit

在文件内容有改动，更改区域有内容后，可以在界面上可视化操作提交当前更改。
![genggaicommit](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/assets/genggaicommit.png)
## 更多 Git 操作在终端 shell 中执行

> 在 IDE 内 Git 版本管理窗口中，有这些 Git 操作终端命令的的提示，操作前查看提示即可

![gitlog](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/assets/gitlog.png)
![gitrevert/reset](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/assets/gitrevert.png)
![branchcheckout](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/assets/branchcheckout.png)
![gitmerge](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/assets/gitmerge.png)

