// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datetimepicker
//= require jquery_ujs
//= require_tree .




$("#menu-toggle").click(function(e) {
		  e.preventDefault();
		  $("#wrapper").toggleClass("toggled");
		});

$(function () {
  $('#datetimepicker4').datetimepicker({
  	viewMode: 'years',
    format: 'MM/DD/YYYY'
  });
});

var new_message;
new_message = function(){
	$('#new_message').on('ajax:before', 
		function(event, data, status){
	});
	$('#new_message').on('ajax:after',
		function(event, data, status){
	});
	$('#new_message').on('ajax:success', function(event, data, status){
		var text = $('#messages').text();
		$('#messages').text(text + data.title + data.body);
	});
};

$(document).ready(function(){
	new_message();
});
