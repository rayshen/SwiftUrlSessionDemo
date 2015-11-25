var express = require('express');
var bodyParser = require('body-parser');

var app = express();
var server = require('http').createServer(app);

app.use(bodyParser.urlencoded({    
  extended: true
}));

var PORT = process.env.PORT || 8002;
server.listen(PORT);
console.log('Server running.');

app.get('/getdemo', function (req, res) { 
	console.log("Get method");
	console.log(req.query); 
	var returnDic = {resultStr: 'get request success'};
  	res.contentType('json');//返回的数据类型
    res.send(JSON.stringify(returnDic));//给客户端返回一个json格式的数据
}); 

app.post('/postdemo', function (req, res) { 
	console.log("Post method");
	console.log(req.body); 
	res.send(req.body); 
}); 
//注意,这个路由应该是加在 var PORT=process.env.PORT || 8002; 上面