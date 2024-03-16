const express = require('express');
const router = express.Router();
const conn = require('../config/config');
const auth  = require('../config/auth');
const myFunctions = require('../helpers/custom_module');
//const fs = require('fs');
// const flash = require('express-flash');
// const session = require('express-session');

router.get('/', (req, res, next)=>{
	var category = req.query.category;
	var fiterQuery='';
	if(category!="" && category!=undefined){
		category = category.replace(/'/g, "");
		fiterQuery = ` and blog.category_id='${category}' `;
	}
	var postSql = `SELECT blog.id, blog.publish, slug, title, imagepath, short_desc, categories.category_name  FROM blog INNER JOIN categories ON blog.category_id=categories.id where blog.status='1' and blog.publish='1' ${fiterQuery} ORDER BY blog.id DESC; 
				SELECT * FROM categories ORDER BY id desc;`;
	conn.query(postSql, function(err,results){
		if(err){
			throw err;
		}else{
			res.render('post-list',{
				posts:results[0],
				categories:results[1],
			});
		}
	});
	
});

router.get('/:slug', (req, res, next)=>{
	var slug = req.params.slug;
	console.log(slug);
	var sql = `SELECT blog.id, blog.status, title,imagepath, short_desc, description, categories.category_name  FROM blog INNER JOIN categories ON blog.category_id=categories.id where blog.slug='${slug}'; 
				SELECT * FROM categories ORDER BY id desc;
				SELECT blog.id, blog.publish, slug, title, imagepath, short_desc, categories.category_name  FROM blog INNER JOIN categories ON blog.category_id=categories.id where blog.status='1' and blog.publish='1' ORDER BY blog.id DESC limit 5;
				SELECT blog_comments.id, msg, users.name, blog_comments.created_at FROM blog_comments INNER JOIN users ON blog_comments.user_id = users.id INNER JOIN blog on blog.id=blog_comments.blog_id where blog.slug='${slug}' ORDER BY created_at DESC `;
	conn.query(sql, function(err, result){
		if(err){
			throw err;
		}else{
			res.render('post-details',{
				title:'Post Details',
				//post:result[0]
				post:result[0][0],
				categories:result[1],
				latestPosts:result[2],
				comments:result[3],
				custom:myFunctions
			});
		}
	});
});

router.post('/:slug', auth, (req, res, next)=>{
	var slug = req.params.slug;
	var comments = req.body.comments;
	var userId = 1;
	var sql = `SELECT blog.id FROM blog where slug='${slug}' and status='1'`;
	conn.query(sql, function(err, result){
		if(err){
			throw err;
		}else{
			var blogId = result[0].id;
			var userId=req.session.user_id;
			if(blogId!=""){
				var commentSql = `INSERT INTO blog_comments SET blog_id='${blogId}', user_id='${userId}', msg='${comments}' `;
				conn.query(commentSql, function(err, result){
					if(err){ throw err; }else{
						res.redirect('back');
					}
				});
			}
			// console.log(blogId);
			// res.redirect('back');
		}
	});
});

module.exports = router;