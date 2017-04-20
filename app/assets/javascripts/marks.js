var initJournal() = function(){
	$.ajax({
	  url:'/marks',
	  type:'GET',
	  dataType:'json',
	  success:function(data){
	  	renderMonthsList();
	  	renderSubjectsList();
	  	buildTable();
	  },
	  error:function(data){
	      //ошибка
	  }
  });
};
var clickMonth() = function(){
	$(".nav-tabs > li > a").click(function(){
		$(".nav-tabs > li.active").removeClass("active");
		$(this).parent().addClass('active');
		var month_id = $(this).attr("id");
	});
	buildTable();
};
var clickDay() = function(){
	//ask for grad
	//post to marks/create with mark data
	//append entered mark to table
};
var clickSubject() = function(){
	//active tab
	buildTable();
};

$(document).ready(){
	initJournal();
	clickMonth();
	clickSubject();
};