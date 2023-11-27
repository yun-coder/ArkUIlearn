import http from '@ohos.net.http';

let httpRequest = http.createHttp();

let url = "https://EXAMPLE_URL";
let promise = httpRequest.request(
  // 请求url地址
  url,
  {
    // 请求方式
    method: http.RequestMethod.POST,
    // 请求的额外数据。
    extraData: {
      "param1": "value1",
      "param2": "value2",
    },
    // 可选，默认为60s
    connectTimeout: 60000,
    // 可选，默认为60s
    readTimeout: 60000,
    // 开发者根据自身业务需要添加header字段
    header: {
      'Content-Type': 'application/json'
    }
  });

promise.then((data) => {
  if (data.responseCode === http.ResponseCode.OK) {
    console.info('Result:' + data.result);
    console.info('code:' + data.responseCode);
  }
}).catch((err) => {
  console.info('error:' + JSON.stringify(err));
});