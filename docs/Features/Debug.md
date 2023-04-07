---
sidebar_position: 3
---

# Debug 调试器

使用模版创建的 `C`、`C++`、`Java`、`Pyhton`、`Go`、`Ruby` 等代码空间默认支持了`Debug`功能。你可以通过点击侧边栏菜单里的调试器图标，打开调试器窗口，添加断点后，开始调试，如下：

![Debug01](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/assets/Debug01.png)

断点是在调试时程序将暂停执行的代码行。当程序暂停时，`调试器`侧栏将显示所有变量的值，从而避免了添加`print / log`语句的需要。

当程序暂停时，其他调试按钮将被启用，如：
- `下一步` 将使程序前进到下一个可能的行，在那里程序可以在源代码中停止。例如，如果当前行正在调用函数，则 `下一步` 将进入函数内部。如果这是函数的最后一行，`下一步` 将返回到调用该函数的位置。
- `下一个断点` 将使程序前进到下一个断点，或者如果在当前断点之后没有更多断点，则前进到程序完成。
- `停止` 将终止调试会话并终止正在调试的进程。


## 多人协同调试

在 1024Code IDE 内调试程序时，所有协作者都将看到任何其他协作者所做的所有调试操作，包括：
- 断点
- 程序暂停的位置
- 变量的内容
- 控制台的输出

效果如下：

![Debug03](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/assets/debug03.gif)


## 设置Debug功能

`Debug`功能的启用与否，是否能正常调试，受配置文件和`Nix`管理的环境基础依赖控制。部分未启用或者`Debug`功能不正常的代码空间，我们可以通过以下方式设置`Debug`功能，使其启用或者恢复正常。

已经启用`Debug`功能的代码空间，我们可以在`Debug`调试器窗口中点击设置按钮，在打开的`Debug`设置弹窗中，修改`Debug`参数，以恢复`Debug`功能。

![Debug02](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/assets/debug02.png)


## 启用Debug功能

在未启用`Debug`功能的代码空间里我们可以通过修改`.1024文件`和通过`Nix`安装`Debug`需要的基础依赖，来启用`Debug`功能。

![Debug04](https://1024-staging-1258723534.cos.ap-guangzhou.myqcloud.com/assets/Debug04.png)

在`.1024文件`中，`debug`功能参数对应的数据结构为: 

```yaml
debug: 
  compile: string // 编译执行命令,需要目标程序携带调试信息
  support: bool   // 是否支持debug,向前兼容
  launch: map[string]any // dap协议launch相关参数
```

通过`Nix`安装`Debug`需要的基础依赖步骤:
1. 在 `shell` 中 `vi/vim` 打开 `.1024nix` 文件
2. 在`packages`中添加需要的依赖，如`pkgs.gdb`
3. 额外指定nix文件的overlays，修改`.1024nix` 文件第一行内容，比如：
``` py
# 删除第一行
# { pkgs ? import <nixpkgs> {} }
# 新增以替换
{ pkgs ? import <nixpkgs> { overlays = [(import /etc/nix/nixpkgs-showmebug/overlay.nix)];} }: 
```

## Java

在.1024文件配置：
    
```yaml
debug:
  compile: javac -encoding utf-8 -g -cp . Main.java # -g 附带调试信息
  launch:
    mainClass: Main
    classPaths: ["."]
    cwd: .
    console: integratedTerminal
    internalConsoleOptions: neverOpen
  support: true

env
```

launch相关参数   [https://code.visualstudio.com/docs/java/java-debugging#_launch](https://code.visualstudio.com/docs/java/java-debugging#_launch)

注意事项
- java debug 是属于lsp的一个插件启动
- console为integratedTerminal
- internalConsoleOptions为neverOpen

## Python3

在.1024文件配置:

```yaml
debug:
  support: true
  launch:
    program: # 文件
    module: # 模块
    python:  # python参数 []string类型
    args:    # 目标参数 []string类型
    django:  # 是否为django
    console: integratedTerminal
    env:
      PYTHONIOENCODING: UTF-8
      PYTHONUNBUFFERED: 1

# 最简示例
debug:
  support: true
  launch:
    program: main.py
    console: integratedTerminal
```

`launch`相关参数   [https://code.visualstudio.com/docs/python/debugging#_request](https://code.visualstudio.com/docs/python/debugging#_request)

需要 `pip install debugpy`
- 换源 `pip install debugpy -i [https://pypi.tuna.tsinghua.edu.cn/simple/](https://pypi.tuna.tsinghua.edu.cn/simple/)`

注意事项
- `console`为`integratedTerminal`

## Go

硬性要求使用`go mod`，需要使用到`dlv` （ `go install github.com/go-delve/delve/cmd/dlv@latest` ）

在nix文件shellHook里加上

```yaml
export PATH=$PATH:~/go/bin
```

在.1024文件配置

```yaml
debug:
  support: true
  launch:
    request: launch
    mode: debug
    program: .
    console: integratedTerminal
    cwd: .
```

`launch`相关参数[https://github.com/golang/vscode-go/wiki/debugging#configuration](https://github.com/golang/vscode-go/wiki/debugging#configuration)

注意事项
- `console`为`integratedTerminal`

## C/C++

在.1024文件配置：

```yaml
debug:
  compile:  # 编译命令，如：gcc(g++) -g -O0 testc -o test ( -g附带调试信息 -O0关闭优化)
  support: true
  launch:
    program: ./test  // 上面compile编译出可执行文件的路径
    MIMode： gdb
    miDebuggerPath： gdb
    externalConsole: true
    cwd: .
    setupCommands:
      - text: -enable-pretty-printing
      ignoreFailures: true
    miDebuggerArgs: -q -ex quit; wait() { fg >/dev/null; }; gdb -q --interpreter=mi // gdb情况下使用
```

`launch`相关参数[https://code.visualstudio.com/docs/cpp/launch-json-reference#_configure-vs-codes-debugging-behavior](https://code.visualstudio.com/docs/cpp/launch-json-reference#_configure-vs-codes-debugging-behavior)


注意事项
- 需要使用nix的方式额外安装`gdb`或者`lldb`依赖：

  ```yaml
  pkgs.gdb // 或者 pkgs.lldb
  pkgs.paaspkgs.cppdap
  ```

- 需要修改在`nix`文件的`overlays`，将第一行改为 { pkgs ? import <nixpkgs> { overlays = [(import /etc/nix/nixpkgs-showmebug/overlay.nix)];} }: 
- 推荐使用`gdb`
- `externalConsole`为`true`

## Ruby

在.1024文件配置：

```yaml
debug:
  support: true
  launch:
    script: ruby main.rb  # 就是程序的启动命令
    localfs: true
```
注意事项:
- `gem install debug`
- 下载的 `bin` 需要设置在`PATH env`中
