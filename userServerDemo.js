var express = require('express');
var bodyParser = require('body-parser');

var PORT = process.env.PORT || 8002;

var app = express();
var server = require('http').createServer(app);
server.listen(PORT);
console.log('Server running.');

var mysql = require('mysql');
var conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database:'NodeDB',
    port: 8889
});
conn.connect();
console.log("Connect Mysql Success");

app.get('/getdemo', function (req, res) { 
	res.contentType('json');//返回的数据类型
	console.log("Get method");
	// console.log(req.query); 
	var selectSQL = 'SELECT * from UserTB where account = "'+req.query.account+'"';
	//select
	conn.query(selectSQL, function (err, rows) {
	 	if (err) console.log(err);
		console.log("SELECT ==> ");
	    for (var i in rows) {
	    	console.log(rows[i]);
	    	res.send(JSON.stringify(rows[i]));//给客户端返回一个json格式的数据
	    }
	});
}); 

app.post('/postdemo', function (req, res) { 
	console.log("Post method");
	console.log(req.body); 
	res.send(req.body); 
}); 

// conn.end();
