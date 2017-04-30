//helper functions
var elementIdBuilder = function(studentId, date){
	return studentId + '_' + date;
};
var dayFromDate = function(date){
	day = new Date(date).getDate();
	return day;
};
//main functions
var buildTable = function(students,days){
	var $mytable = $('#mytable').empty();
	console.log('building new table');
	var $tr = $('<tr>');
	$tr.append($('<th>').append("Student Name"));
	$.each(days, function(index, day){
	 	$tr.append($('<th>').append(day));
	  $mytable.append($tr);
	});

	$.each(students, function(index, student){
		$tr = $('<tr>');
		$tr.append($('<td>').append(student.full_name));
		$.each(days, function(index, day){
			$tr.append($('<td>', {id: elementIdBuilder(student.id, day)}).prop('contenteditable', true))
		});
		$mytable.append($tr);
	});

};

var createMark = function(){
	$("#mytable").on('keyup', 'td', function(event){
    if(event.keyCode == 13){
	    var grade = $(this).text();
			var month = $("#months > li.active a").attr("id");
			var subject = $("#subjects > li.active a").attr("id");
			var student = $(this).attr("id").split("_")[0];
			var day = $(this).attr("id").split("_")[1];
			var date = "2017" + "-" + month + "-" + day;
			$.ajax({
				url: "/marks",
				type: "POST",
				data:{
					subject_id: subject,
					student_id: student,
					grade: grade,
					date: date
				}
			});
    };
	});
};

var fillTable = function(marks){
	$.each(marks, function(index, mark){
		did = '#' + elementIdBuilder(mark.student_id, dayFromDate(mark.date));
		$(did).addClass('marked');
		$(did).text(mark.grade);
	});
};
//event functions

var changeMonth = function(){

 	$(".nav-tabs > li > a").click(function(){
		$(".nav-tabs > li.active").removeClass("active");
		$(this).parent().addClass('active');
		var month = $(this).attr("id");
		var subject = $(".nav-pills > li.active a").attr("id");
		loadData(month, subject);
	});
};

var changeSubject = function(){
	$(".nav-pills > li").first().addClass("active")

	$(".nav-pills > li > a").click(function(){
		$(".nav-pills > li.active").removeClass("active");
		$(this).parent().addClass('active');
		var subject = $(this).attr("id");
		var month = $(".nav-tabs > li.active a").attr("id");
		loadData(month, subject);
	});
};


var loadData = function(month, subject){
 		$.ajax({
		  url:'/loaddata',
		  type:'GET',
		  dataType:'json',
		  data:{
		  	subject_id: subject,
		  	month: month
		  },
		  success:function(data){
		  	buildTable(data.students, data.days);
		  	fillTable(data.marks);
		  },
		  error:function(data){
		  }
	  });
};
$(document).ready(function(){
	var month = $(".nav-tabs > li.active a").attr("id");
	loadData(month, 1);
	changeMonth();
	changeSubject();
	createMark();
});
