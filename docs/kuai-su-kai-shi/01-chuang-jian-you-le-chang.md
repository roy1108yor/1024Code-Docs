# 创建游乐场

### 初始化一个游乐场

#### 后端发起创建请求

{% swagger method="post" path="/playgrounds" baseUrl="https://api.1024paas.com/v1" summary="创建游乐场" %}
{% swagger-description %}

{% endswagger-description %}

{% swagger-parameter in="body" name="codeZoneId" type="String" required="true" %}

{% endswagger-parameter %}

{% swagger-parameter in="body" name="type" type="String" %}

{% endswagger-parameter %}

{% swagger-response status="201: Created" description="" %}
```javascript
{
    "status": "success",
    "data": {
        "playgroundId": "xxxx-xxxxx-xxxxx",
	"type": "EDIT"
    }
}
```
{% endswagger-response %}
{% endswagger %}

#### 前端SDK连接游乐场

> URL:/**?playgroundId=1\&name=liming**

**playgroundId 和 name 等非隐私数据直接通过URL query 传递。**

### 用户加入游乐场
