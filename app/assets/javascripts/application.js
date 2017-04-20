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


var handleClicks = function(){
  $('#mytable td').click(function(){
    var date = $('#mytable th').eq($(this).index()).attr('id'); //находим дату
    var grade = prompt("Enter grade"); //запрашиваем оценку, подумай как украсить
    var student = $(this).closest('tr').attr('id'); //находим student id через аттрибут id tr
    var subject = "1"; //эту часть попробуй сам написать
    console.log(student);

    $.ajax({
    	context: this,
      url:'/marks',
      type:'POST',
      dataType:'json',
      data:{
        mark:{ //создаем объект Mark
          date: date,
          student_id: student,
          subject_id: subject,
          grade: grade
        }
      },
      success:function(data){
      	$(this).css('background-color', '#5cb85c');
      },
      error:function(data){
          //ошибка
      }
  });
  });
};
$(document).ready(function(){
  handleClicks();
  new_message();
  monthTabChange();
});

$("#group-list li a").click(function(){
  $(this).parents(".dropdown").find('.btn').html($(this).text() + ' <span class="caret"></span>');
  $(this).parents(".dropdown").find('.btn').val($(this).data('value'));
});

var monthTabChange = function(){
	$(".nav-tabs > li > a").click(function(){
	$(".nav-tabs > li.active").removeClass("active");
	$(this).parent().addClass('active');
	var month = $(this).attr("id");
	console.log(month); 
	$.ajax({
    url:'/marks',
    type:'GET',
    dataType:'json',
    data:{
      month: month
    },
    success:function(data){
    	console.log(data);
    },
    error:function(data){
        //ошибка
    }	
	});
	});
}

