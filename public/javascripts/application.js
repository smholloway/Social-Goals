	$('.public_goal_on').live('click', function(){
		$(this).siblings('form').submit();
	});

	$('.private_goal_on').live('click', function(){
		$(this).siblings('form').submit();
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
	
