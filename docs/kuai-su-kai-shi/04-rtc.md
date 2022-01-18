# 发起音视频

## Install

```bash
npm i @dao42/d42paas_rtc
```

## 名词解释

### CID 频道

`Channel ID` 对应到供应商对概念：房间，频道，要进行音视频通信的两个人必须处于同一个频道里

每个客户端同一时刻只能加入一个频道里，同一频道里的用户可以互相通信，但不能跨频道通信

### UID 用户

`User ID` 要对每一个进入频道的用户做一个标识，因此同一个频道内不能同时存在相同的 User ID

目前实现使用传入的 UID 和供应商有个映射关系（为什么这样做？不同供应室的用户标识支持情况不同，这个和 SFU 架构实现有关）

### SID 会话

`Session ID`，由于同一个用户标识同一时刻只能在一个频道里只能有一个，有些业务场景要求同一用户同时开两个设备音视频的设备

和供应商 SFU 的映射关系是：`SFU-uid` = `uid` + `sid`

```typescript
{
  channel-test<CID>: {
    user_1<UID>: {
      main<SID>,
      screen<SID>,
    },
    user_2<UID>: {
      main<SID>,
      screen<SID>,
    }
  }
}
```

