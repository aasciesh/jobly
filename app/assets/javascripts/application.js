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
	$('#successDiv').empty();
	$('#errorDiv').empty();
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
    });

    $('#job_seeker').click(function(){
        $('#job_seeker_signup').fadeIn();
        $('#company_signup').hide();
    });
});