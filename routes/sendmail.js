const express = require('express');
var router = express.Router();
var conn = require('../config/config');
//const auth  = require('../config/auth');

const nodemailer = require('nodemailer'); 
const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
      user: 'ss.snm1503@gmail.com',
      pass: 'cusfliykujpayzel'
    }
  });

router.get('/', (req, res, next)=>{
	res.send('This is the send mail module.');
	const mailOptions = {
		from: 'ss.snm1503@gmail.com',
		to: 'satyendrasinghbca777@gmail.com',
		subject: 'Node js Send Mail',
		text: 'This mail testing using node js send mail implementation.',
		//html: `
		//  <h1>Sample Heading Here</h1>
		//  <p>message here</p>
		//`,
		// attachments: [
		  // {
			// filename: 'image.png',
			// path: '<https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png>'
		  // }
		// ]
	};
	
	transporter.sendMail(mailOptions, function(error, info){
		if (error) {
		  console.log(error);
		} else {
		  console.log('Email sent: ' + info.response);
		}
	});
  
});



module.exports = router;