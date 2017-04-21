
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
			$tr.append($('<td>', {id: elementIdBuilder(student.id, day)}))
		});
		$mytable.append($tr);
	});
	
};

var fillTable = function(marks){
	$.each(marks, function(index, mark){
		did = '#' + elementIdBuilder(mark.student_id, dayFromDate(mark.date));
		$(did).text(mark.grade);	
	});
};

//event functions
// var enterMark = function(subject_id, month, year){
// 	$('#mytable td').click(function(){
// 		did = $(this).attr('id').split('_');
// 		student_id =  did[0];
// 		date = year + "-" + month + "-" + did[1];
// 		var grade = prompt("Enter grade");
// 		$.ajax({
//       url:'/marks',
//       type:'POST',
//       dataType:'json',
//       data:{
//         mark:{
//           date: date,
//           student_id: student_id,
//           subject_id: subject_id,
//           grade: grade
//         }
//       },
//       success:function(data){
//           console.log(data);      },
//       error:function(data){
//           debugger;
//       }
//     });
// 	});
// };
var changeMonth = function(){
 	$(".nav-tabs > li > a").click(function(){
		$(".nav-tabs > li.active").removeClass("active");
		$(this).parent().addClass('active');
		var month = $(this).attr("id");
		console.log(month);
		loadData(month);
	});
};
// var changeGroup = function(){
//  	$("#group-button").click(function(){
// 		var group = $(this).attr("id");
// 		console.log(month);
// 		$.ajax({
// 		  url:'/marks',
// 		  type:'GET',
// 		  dataType:'json',
// 		  data:{
// 		  	month: month
// 		  },
// 		  success:function(data){
// 		  	console.log(data);
// 		  },
// 		  error:function(data){
// 		      //ошибка
// 		  }
// 	  });
// 	});
// };

var loadData = function(month){
		var days = [1,2,3,4,5,6,7,8,9,10];
	 		$.ajax({
			  url:'/loaddata',
			  type:'GET',
			  dataType:'json',
			  data:{
			  	group_id: 1,
			  	subject_id: 1,
			  	month: month
			  },
			  success:function(data){
			  	buildTable(data.students, days);
			  	fillTable(data.marks);
			  },
			  error:function(data){
			      //ошибка
			  }
		  });
};
$(document).ready(function(){
	loadData('2017-03-01', '2017-03-31');
	changeMonth();
});
>>>>>>> 692f0a3
