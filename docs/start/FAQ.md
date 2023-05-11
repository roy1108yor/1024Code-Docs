---
sidebar_position: 2
---

# 常见问题

### 1 编程环境有哪些需要注意的事项？

1、代码空间基于Linux环境，所以如 `Win32file` 等其他操作系统（如Windows系统）特定的依赖包将无法使用。

2、代码空间运行在虚拟环境（ docker 容器提供）中，部分命令会受到限制，如Python环境中无法指定用户（命令中带 --user 会报错）。

3、代码空间模版可能会有多个不同的版本，比如 C 语言模板的 `GCC` 和` Clang` 版本 （`GCC` 和` Clang` 是不同的环境，`GCC` 环境仅做对了标准库依赖的支持），请按需选择模版创建。

<br />

### 2 上传文件有什么限制？

1、上传文件支持选择文件上传和拖拽上传，但：

   - 暂时只支持单次上传 500 个以内的文件（各个文件夹内文件加起来），超过 500 个的项目文件，需要您分次上传。
   - 或者通过将文件压缩后，先上传压缩包，再解压（在终端执行 `unzip` 命令）的方式完成本地项目文件上传。

2、`Shell` 终端支持 `git` 命令，若您有存储在 `github` 的项目，你可以用 `git clone` 命令 `clone` 项目文件。

> 拖拽上传
![拖拽上传](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/gif-02.gif)

<br />

### 3 如何修改运行命令，指定文件运行？

![设置运行和编译命令](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/editruncommand.png)

点击 IDE 运行按钮旁边的设置按钮，打开 Configure 窗口，对编译和运行命令以及运行是否包含图形输出（GUI）进行设置。

配置规则参考：https://docs.1024code.com/Features/runcommand

### 4 无法使用 sudu 和 apt 命令

1024Code 使用 [NixOS](https://search.nixos.org/packages?channel=22.05&show=pcre&from=0&size=50&sort=relevance&type=packages&query=pcre) 对 IDE 进行环境管理（不支持sudu和apt），我们需要通过修改代码空间的nix配置文件 `.1024nix`，在 `.1024nix` 的 packages 中添加新的依赖项。
       
`.1024nix` 为受限的隐藏文件，所以需要我们在 shell 中用 vim 命令对文件进行修改，或者使用`cp` 命令将`.1024nix` 复制成新文件到文件树打开进行修改， 如`cp .1024nix 1`。修改后，再执行`cp 1 .1024nix` 命令，使 “1” 文件中的内容覆盖`.1024nix` 文件中的内容；然后点击运行按钮，重新运行项目，以更新环境基础依赖。
    
![gif](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/doc_assets/Cases/%E4%B8%BAnginx%E5%AE%89%E8%A3%85%E4%BE%9D%E8%B5%96%E9%A1%B9.gif)

### 5 在线IDE中浏览器启动问题的解决

如果你需要在代码空间内启动浏览器，不要忘记把http服务端口号设置为8080。这样可以确保你的浏览器能够正确地和你的代码空间进行通信。
