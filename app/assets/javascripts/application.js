// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require ckeditor/init
//= require_tree .

$(document).ready( function(){
	if($('#errorDiv:has(*)').length > 0 )
	{
		displayError();
	}
	if($('#successDiv:has(*)').length > 0 )
	{
		displaySuccess();
	}
	$('#cover').click(function(){hideAjaxForm();});
});
var errorThread= null;
var successThread= null;
var msgDisplayThread= null;
function displayhidden(time)
{
	clearTimeout(msgDisplayThread);
	var $this = $('#servermsg');
	$this.show();
	msgDisplayThread = setTimeout(function(){$this.hide();}, time);
}
function displaySuccess()
{
	var time =5000
	clearTimeout(successThread);
	var $this = $('#successDiv');
	$this.show();
	successThread = setTimeout(function(){$this.hide().empty();},time)
	displayhidden(time);
}
function displayError()
{
	var time=10000
	clearTimeout(errorThread);
	var $this = $('#errorDiv');
	$this.show();
	errorThread = setTimeout(function(){$this.hide().empty();},time)
	displayhidden(time);
}
function forceCloseMsgDiv()
{
	clearTimeout(msgDisplayThread);
	clearTimeout(successThread);
	clearTimeout(errorThread);
	$('#servermsg').hide();
	$('#successDiv').hide().empty();
	$('#errorDiv').hide().empty();
}

function displayAjaxForm()
{
	$('#cover').fadeIn();
	$('#ajaxForm').show();
	$("#ajaxForm").animate({"right": "0px"}, 300);
}
function hideAjaxForm()
{

	$("#ajaxForm").animate({"right": "-500px"}, 300);
	setTimeout(function(){$('#cover').fadeOut(); $('#ajaxForm').hide();}, 200)
	
}
 $(function() {             
    $('#company').click(function(){            
        $('#job_seeker_signup').hide();
        $('#company_signup').fadeIn();  
        $("#company").addClass("active");
         $("#job_seeker").removeClass("active");
    });

    $('#job_seeker').click(function(){
        $('#job_seeker_signup').fadeIn();
        $('#company_signup').hide();
        $("#job_seeker").addClass("active");
         $("#company").removeClass("active");
    });
});












 /*
 Color animation 20120928
 http://www.bitstorm.org/jquery/color-animation/
 Copyright 2011, 2012 Edwin Martin <edwin@bitstorm.org>
 Released under the MIT and GPL licenses.
*/
(function(d){function m(){var b=d("script:first"),a=b.css("color"),c=false;if(/^rgba/.test(a))c=true;else try{c=a!=b.css("color","rgba(0, 0, 0, 0.5)").css("color");b.css("color",a)}catch(e){}return c}function j(b,a,c){var e="rgb"+(d.support.rgba?"a":"")+"("+parseInt(b[0]+c*(a[0]-b[0]),10)+","+parseInt(b[1]+c*(a[1]-b[1]),10)+","+parseInt(b[2]+c*(a[2]-b[2]),10);if(d.support.rgba)e+=","+(b&&a?parseFloat(b[3]+c*(a[3]-b[3])):1);e+=")";return e}function g(b){var a,c;if(a=/#([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})/.exec(b))c=
[parseInt(a[1],16),parseInt(a[2],16),parseInt(a[3],16),1];else if(a=/#([0-9a-fA-F])([0-9a-fA-F])([0-9a-fA-F])/.exec(b))c=[parseInt(a[1],16)*17,parseInt(a[2],16)*17,parseInt(a[3],16)*17,1];else if(a=/rgb\(\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*\)/.exec(b))c=[parseInt(a[1]),parseInt(a[2]),parseInt(a[3]),1];else if(a=/rgba\(\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9\.]*)\s*\)/.exec(b))c=[parseInt(a[1],10),parseInt(a[2],10),parseInt(a[3],10),parseFloat(a[4])];return c}
d.extend(true,d,{support:{rgba:m()}});var k=["color","backgroundColor","borderBottomColor","borderLeftColor","borderRightColor","borderTopColor","outlineColor"];d.each(k,function(b,a){d.Tween.propHooks[a]={get:function(c){return d(c.elem).css(a)},set:function(c){var e=c.elem.style,i=g(d(c.elem).css(a)),h=g(c.end);c.run=function(f){e[a]=j(i,h,f)}}}});d.Tween.propHooks.borderColor={set:function(b){var a=b.elem.style,c=[],e=k.slice(2,6);d.each(e,function(h,f){c[f]=g(d(b.elem).css(f))});var i=g(b.end);
b.run=function(h){d.each(e,function(f,l){a[l]=j(c[l],i,h)})}}}})(jQuery);