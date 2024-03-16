const express = require('express');
var router = express.Router();
var conn = require('../config/config');
const auth  = require('../config/auth');

router.get('/', auth, (req, res, next)=>{
	
	conn.query('SELECT * FROM users ORDER BY id desc', function(err,data){
		if(err){
			throw err;
		}else{
			res.render('users/user-list',{
				users:data
			});
		}
	});
	
});

router.get('/add', (req, res, next)=>{
	res.render('add-user',{
		
	});
});


module.exports = router;