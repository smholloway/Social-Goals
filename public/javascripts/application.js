	$('.public_goal_on').live('click', function(){
		$(this).siblings('form').submit();
	});

	$('.private_goal_on').live('click', function(){
		$(this).siblings('form').submit();
	});
