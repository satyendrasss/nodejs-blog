/*
const express = require('express');
const app = express();
const PORT = 8000;

app.get('/', function(req,res){
	res.send('Hello');
});

*/

/* OR
app.get('/', (req,res)=>{
	res.send('Hello');
});
*/
require('dotenv').config();
const PORT = 8000;
// var createError = require('http-errors');
var express = require('express');
var path = require('path');
var flash = require('express-flash');
var session = require('express-session');
var mysql = require('mysql');
var conn  = require('./config/config');
var auth  = require('./config/auth');
var usersRouter = require('./routes/users');
var categoryRouter = require('./routes/category');
var blogRouter = require('./routes/blog');
var mailRouter = require('./routes/sendmail');

var postRouter = require('./routes/post');
var app = express();



// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));
var uniqid = require('uniqid'); 

var minutes = 1000*60*15; //15 minutes
app.use(session({ 
	 genid: function(req) {
		return uniqid() // use UUIDs for session IDs
	  },
    cookie: { maxAge: minutes }, // session timeout of 60 seconds  [60*1000] so 1000*60*15 [15minutes]
    //store: new session.MemoryStore,
    saveUninitialized: false,
    resave: false,
    secret: 'secretkeyisSatyendraSingh',
	cookie: { secure: false }
}));

app.get('/', (req,res)=>{
	//res.send('Hello');
	console.log(req.session.name);
	var color = '#' + Math.random().toString(16).substr(-6);
	
	conn.query("SELECT blog.id, blog.publish, slug, title, imagepath, short_desc, categories.category_name  FROM blog INNER JOIN categories ON blog.category_id=categories.id where blog.status='1' and blog.publish='1' ORDER BY blog.id DESC limit 4", function(err,results){
		if(err){
			throw err;
		}else{
			res.render('home',{
				posts:results,
				color:color,
				session:req.session
			});
		}
	});
	
	// res.render('home',{
		// color:color
	// })
});

app.get('/blank',(req,res)=>{
	res.render('blank',{
		title:'This is the Blank Page...'
	});
})

app.get('/login', (req, res)=>{
	var color = '#' + Math.random().toString(16).substr(-6);
	res.render('login',{
		color:color
	})
});

app.post('/login',(req, res)=>{
	var user_email = req.body.user_email;
	var user_pass = req.body.user_pass;
	var loginSql = `SELECT id, name, email, role from users where email='${user_email}' and password='${user_pass}' and status='1' `;
	conn.query(loginSql, function(err, result){
		if(err) throw err;
		
		if(result.length>0){
			req.session.isLoggedIn = true;
			req.session.name = result[0].name;
			req.session.email = result[0].email;
			req.session.role = result[0].role;
			req.session.user_id = result[0].id;
			if(result[0].role==='Admin'){
				res.redirect('/dashboard');
			}
			res.redirect('/profile');
		}else{
			console.log('Invalid User ID or Password.');
			res.redirect('/login');
		}
		
	})
});

app.get('/profile',(req, res)=>{
	res.render('user-profile',{
		session : req.session
	});
	
})

app.get('/register', (req, res)=>{
	var color = '#' + Math.random().toString(16).substr(-6);
	res.render('register',{
		color:color,
		errors:""
	})
});

app.get('/welcome',(req,res)=>{
	res.render('welcome',{
		msg:''
	})
})

app.post('/register', (req, res)=>{
	var color = '#' + Math.random().toString(16).substr(-6);
	var user_fname = req.body.user_fname;
	var user_email = req.body.user_email;
	var user_pass = req.body.user_pass;
	var user_conpass = req.body.user_conpass;
	var errors={};
	
	
	if (!(/^[\-0-9a-zA-Z\.\+_]+@[\-0-9a-zA-Z\.\+_]+\.[a-zA-Z]{2,}$/).test(String(user_email))) {
		errors.user_email = 'Email is not valid.';
	}
	if(!String(user_fname).trim()){
		errors.user_fname = 'Full name is required';
	}
	if(!String(user_email).trim()){
		errors.user_email = 'Email is required';
	}
	
	if(!String(user_pass).trim()){
		errors.user_pass = 'Password is required';
	}
	
	if(!String(user_conpass).trim()){
		errors.user_conpass = 'Confirm Password is required';
	}
	
	if(user_pass!=user_conpass){
		errors.cnfpass='Password and Confirm password is not match.';
	}
	
	/* if(user_email!=""){
		var existUserSql = `SELECT id FROM users where email='${user_email}'`;
		conn.query(existUserSql, function(err, result){
			if(err) throw err;
			
			if(result.length>0){
				console.log(result);
				errors.user_email='Email Id already exist.';
			}
		});
	} */
	
	//console.log(Object.keys(errors).length);
	//console.log(errors);
	if(Object.keys(errors).length>0){
		
		res.render('register',{
			color:color,
			errors:errors
		})
	}else{
		//res.send('sss');
		if(user_email!=""){
			var existUserSql = `SELECT id FROM users where email='${user_email}'`;
			conn.query(existUserSql, function(err, result){
				if(err) throw err;
				
				if(result.length>0){
					errors.user_email='Email Id already exist.';
					res.render('register',{
						color:color,
						errors:errors
					});
				}else{
					var regSql=`INSERT INTO users SET name='${user_fname}', email='${user_email}', password='${user_pass}', role='User'`;
					conn.query(regSql, function(err, result){
						if(err) throw err;
						res.render('welcome',{
							msg:''
						})
					});
				}
			});
		}
		
	}
	
});



app.get('/dashboard', auth,(req, res)=>{
	console.log(req.session);
	res.render('dashboard',{
		session : req.session
	})
});

app.get('/logout', function(request, response, next){
    request.session.destroy();
    response.redirect("/");
});

app.use(function(req, res, next) {
  res.locals.session = req.session;
  next();
});

app.use(flash());
app.use('/users', usersRouter);
app.use('/category',categoryRouter);
app.use('/blog',blogRouter);
app.use('/sendmail',mailRouter);

app.use('/post',postRouter);





app.listen(PORT, function(){
	console.log('Server is running on port '+PORT);
})