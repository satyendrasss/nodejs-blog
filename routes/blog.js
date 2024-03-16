const express = require('express');
const router = express.Router();
const conn = require('../config/config');
const auth  = require('../config/auth');
const upload = require('../helpers/uploader');
const myFunctions = require('../helpers/custom_module');
const fs = require('fs');
// const flash = require('express-flash');
// const session = require('express-session');

function addslashes(string) {
    return string.replace(/\\/g, '\\\\').
        replace(/\u0008/g, '\\b').
        replace(/\t/g, '\\t').
        replace(/\n/g, '\\n').
        replace(/\f/g, '\\f').
        replace(/\r/g, '\\r').
        replace(/'/g, '\\\'').
        replace(/"/g, '\\"');
}

router.get('/', auth, (req, res, next)=>{
	
	conn.query("SELECT blog.id, blog.publish, title,imagepath, short_desc, categories.category_name  FROM blog INNER JOIN categories ON blog.category_id=categories.id where blog.status='1' ORDER BY blog.id DESC", function(err,results){
		if(err){
			throw err;
		}else{
			res.render('blog/blog-list',{
				blogs:results,
				msg:req.flash('msg')
			});
		}
	});
	
});

router.get('/add', auth, (req, res, next)=>{
	var sql = `SELECT * FROM categories ORDER BY id desc`;
	conn.query(sql, function(err, data){
		if(err){ 
			throw err;
		}else{
			res.render('blog/add-blog',{
				categories:data
			})
		}
	});
	
});

// router.post('/add', upload.fields([{name:'imagepath',maxCount:1}]), (req, res, next)=>{
router.post('/add', auth, upload.single('imagepath'), (req, res, next)=>{
	var category_id = req.body.category_id;
	var title = req.body.title;
	var short_desc = req.body.short_desc;
	var description = req.body.description;
	// description = description.replace(/(\r\n|\n|\r)/gm, "");
	title=title.replace(/'/g, "\\'");
	short_desc=short_desc.replace(/'/g, "\\'");
	description=description.replace(/'/g, "\\'");
	var imagefilename='';
	console.log(req.file);
	if(req.file !== undefined){
		imagefilename = req.file.filename;
	}
	
	var slug = myFunctions.slugify(title);
	
	var user_id = 1; 
	var insertBlogSql = `INSERT INTO blog SET category_id='${category_id}', slug='${slug}', title='${title}', short_desc='${short_desc}', description='${description}', imagepath='${imagefilename}', user_id='${user_id}' `;
	conn.query(insertBlogSql, function(err, result){
		if(err) throw err;
		req.flash('msg', 'A new blog added successfully.');
		res.redirect('/blog');
	});
});

router.get('/show/:id', auth, (req, res, next)=>{
	var bid = req.params.id;
	var sql = `SELECT blog.id, blog.status, title,imagepath, short_desc, description, categories.category_name  FROM blog INNER JOIN categories ON blog.category_id=categories.id where blog.id='${bid}' `;
	//console.log(sql);
	conn.query(sql, function(err, result){
		if(err){
			throw err;
		}else{
			//console.log(result);
			res.render('blog/blog-details',{
				title:'Blog Details',
				blogdetails:result[0]
			});
		}
	});
});


router.get('/edit/:id', auth, (req, res, next)=>{
	var bid = req.params.id;
	var sql = `select * from blog where id='${bid}'; SELECT * FROM categories ORDER BY id desc`;
	conn.query(sql, function(err, data){
		if(err){ 
			throw err;
		}else{
			console.log(data[1]);
			res.render('blog/blog-edit',{
				blog:data[0][0],
				categories:data[1]
			})
		}
	})
});

router.post('/edit/:id', auth, upload.single('imagepath'), (req, res)=>{
	var bid = req.params.id;
	console.log(bid);
	var category_id = req.body.category_id;
	var title = req.body.title;
	var short_desc = req.body.short_desc;
	var old_file = req.body.old_file;
	var description = req.body.description;
	// title=title.replace(/'/g, "\\'");
	// short_desc=short_desc.replace(/'/g, "\\'");
	// description=description.replace(/'/g, "\\'");
	
	title=addslashes(title);
	short_desc=addslashes(short_desc);
	description=addslashes(description);
	
	
	var imagefilename=old_file;
	console.log(req.file);
	if(req.file !== undefined){
		imagefilename = req.file.filename;
		fs.unlink(__dirname+'/../public/uploads/blogs/' + old_file, (err) => {
			if (err) {
				//throw err;
				console.log('File not found.');
			}
			console.log("Delete File successfully.");
		});
	}
	var user_id = 1; 
	var updateBlogSql = `UPDATE blog SET category_id='${category_id}', title='${title}', short_desc='${short_desc}', description='${description}', imagepath='${imagefilename}', user_id='${user_id}' WHERE id='${bid}' `;
	conn.query(updateBlogSql, function(err, result){
		if(err) throw err;
		res.redirect('/blog');
	});
});

router.get('/delete/:id', auth, (req, res)=>{
	var bid = req.params.id;
	var deleteBlogSql = `UPDATE blog SET status='0' WHERE id='${bid}' `;
	conn.query(deleteBlogSql, function(err, result){
		if(err) throw err;
		res.redirect('/blog');
	});
});

router.get('/unpublish/:id', auth, (req, res)=>{
	var bid = req.params.id;
	var unpBlogSql = `UPDATE blog SET publish='2' WHERE id='${bid}' `;
	conn.query(unpBlogSql, function(err, result){
		if(err) throw err;
		res.redirect('/blog');
	});
});

router.get('/publish/:id', auth, (req, res)=>{
	var bid = req.params.id;
	var unpBlogSql = `UPDATE blog SET publish='1' WHERE id='${bid}' `;
	conn.query(unpBlogSql, function(err, result){
		if(err) throw err;
		res.redirect('/blog');
	});
});




module.exports = router;