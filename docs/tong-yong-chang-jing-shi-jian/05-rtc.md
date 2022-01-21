# 音视频基础服务

## 刷新页面后恢复

音视频支持状态导入和导出

例如：刷新页面后恢复。在刷新页面之前把状态导出，并存在 `localstorage` 里面，然后在刷新之后把这个状态给音视频模块，可以恢复之前的状态

当然，也可以通过手动构造一个状态参数，来直接启动音视频

```javascript
// Save d42rtc State to localStorage
localStorage.setItem('rtc', JSON.stringify(d42rtc.getState()))

// Read the localStorage set State
d42rtc.setState(JSON.parse(localStorage.getItem('rtc') || ""))
```

