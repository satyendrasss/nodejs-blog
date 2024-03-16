var mysql = require('mysql');
var connection = mysql.createConnection({
	host:'localhost',
	user:'root',
	password:'',
	database:'node',
	multipleStatements:true
});

connection.connect(function(err){
	if(err) throw err;
	console.log('database conected successfully');
});

module.exports = connection;