const express = require('express');
var router = express.Router();
var conn = require('../config/config');
const auth  = require('../config/auth');

router.get('/', auth, (req, res, next)=>{
	
	conn.query('SELECT * FROM categories ORDER BY id desc', function(err,results){
		if(err){
			throw err;
		}else{
			res.render('category/category-list',{
				categories:results
			});
		}
	});
	
});

router.get('/add', auth, (req, res, next)=>{
	res.render('category/add-category',{
		
	});
});

router.post('/add', auth, (req, res, next)=>{
	var category_name = req.body.category_name;
	var insertCatSql = `INSERT INTO categories SET category_name='${category_name}'`;
	conn.query(insertCatSql, function(err, result){
		if(err) throw err;
		//req.flash('insertMsg', `Product Added Successfully `);
		res.redirect('/category');
	});
});


module.exports = router;