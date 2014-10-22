<?php 
	// ket noi
	$dbc = mysql_connect('localhost','root','');
	// chon scdl thao tac
	if(!$dbc)
	{
		die('Not connect: '.mysql_error());
	}
	$state = mysql_select_db('blogging_cms',$dbc);
	if(!$state)
	{
		die('Can not selected database:'.mysql_error());
	}
?>