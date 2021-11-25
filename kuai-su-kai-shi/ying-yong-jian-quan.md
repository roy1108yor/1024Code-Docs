# 应用鉴权

### 服务端鉴权

租户接入PaaS平台前，需要先在PaaS平台申请tenantCode与tenantSecret。每次请求租户后端请求PaaS时，需要在header里面添加tenantCode,nonce,timestamp,secret。

nonce：每次生成的随机字符串

timestamp：时间戳。PaaS只处理30秒以内的请求。

secret：通过AES算法，用tenantSecret加密字符串tenantCode + nonce + timestamp得到。



### JS SDK鉴权

租户的一个用户要进入Playground之前，需要租户后台调用PaaS平台的“发行入场券”接口获取一张入场券（ticket)以及入场地址（ideServerURL)。然后租户的前端把ticket，tenantCode，userId，playgroundId，userName`，ideServerURL等传递给W`ebIDE对象。WebIDE对象会自动连接`ideServerURL与PaaS平台进行连接并鉴权。`

``

首先，租户由 Paas 平台获取 { token, secret }。

以 `*.js` 的方式引入 JS SDK，或以 npm 等包管理工具安装后，在目标文件使用：

`import DaoPaas from 'dao_paas'`

引入后使用 `new DaoPaas({ token, secret })` 获取相应的 IDE 对象。

鉴权将在新建对象时自动完成。







