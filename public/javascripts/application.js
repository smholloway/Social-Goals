	$('.public_goal_on').live('click', function(){
		$(this).siblings('form').submit();
	});

	$('.private_goal_on').live('click', function(){
		$(this).siblings('form').submit();
	});
	
	$(".private_goal_on").live({
	  mouseenter: function() { 
	    $(this).append($(" <div id='public_private_description' class='hover'>Private goals are only visible to you. <br/>Public goals are visible to everyone.</div>"));
	  },
	  mouseleave: function () {
	    $(this).find("div:last").remove();
	  }
	});
	$(".public_goal_on").live({
	  mouseenter: function() { 
	    $(this).append($(" <div id='public_private_description' class='hover'>Public goals are visible to everyone.<br/>Private goals are only visible to you.</div>"));
	  },
	  mouseleave: function () {
	    $(this).find("div:last").remove();
	  }
	});
	
	$('.plus_minus').live('click', function(){
		$(this).siblings('.task_list').toggle();
		if ($(this).text() == '+') {
			$(this).replaceWith('<div class="plus_minus">-</div>');
		} else {
			$(this).replaceWith('<div class="plus_minus">+</div>');
		}
	});
	
	$('#new_task_button').live('click', function(){
		$('#new_task_button').toggle();
		$('#new_task_container').toggle();
	});
	
