var myFunctions = { 
    timeAgo:function(date){
		var seconds = Math.floor((new Date() - date) / 1000);
		var interval = seconds / 31536000;
		if (interval > 1) {
			return Math.floor(interval) + " years";
		}
		interval = seconds / 2592000;
		if (interval > 1) {
			return Math.floor(interval) + " months";
		}
		interval = seconds / 86400;
		if (interval > 1) {
			return Math.floor(interval) + " days";
		}
		interval = seconds / 3600;
		if (interval > 1) {
			return Math.floor(interval) + " hours";
		}
		interval = seconds / 60;
		if (interval > 1) {
			return Math.floor(interval) + " minutes";
		}
		return Math.floor(seconds) + " seconds";
    },
	
	/* SLUG-Generate string to slug  */
    slugify:function(str){
		return String(str)
		.normalize('NFKD') // split accented characters into their base characters and diacritical marks
		.replace(/[\u0300-\u036f]/g, '') // remove all the accents, which happen to be all in the \u03xx UNICODE block.
		.trim() // trim leading or trailing whitespace
		.toLowerCase() // convert to lowercase
		.replace(/[^a-z0-9 -]/g, '') // remove non-alphanumeric characters
		.replace(/\s+/g, '-') // replace spaces with hyphens
		.replace(/-+/g, '-'); // remove consecutive hyphens
    },
    cleanString:function(string){
		return string.replace(/\\/g, '\\\\').
        replace(/\u0008/g, '\\b').
        replace(/\t/g, '\\t').
        replace(/\n/g, '\\n').
        replace(/\f/g, '\\f').
        replace(/\r/g, '\\r').
        replace(/'/g, '\\\'').
        replace(/"/g, '\\"');
    },
	myfunc4:function(){
    },
	myfunc5:function(){
    },
	myfunc6:function(){
    },
	myfunc7:function(){
    },
	
}
module.exports=myFunctions;