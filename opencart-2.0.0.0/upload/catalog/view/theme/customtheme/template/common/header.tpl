<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><?php echo $title; ?></title>
	<base href="<?php echo $base; ?>" />
	<?php if ($description) { ?>
	<meta name="description" content="<?php echo $description; ?>" />
	<?php } ?>
	<?php if ($keywords) { ?>
	<meta name="keywords" content= "<?php echo $keywords; ?>" />
	<?php } ?>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<?php if ($icon) { ?>
	<link href="<?php echo $icon; ?>" rel="icon" />
	<?php } ?>
	<?php foreach ($links as $link) { ?>
	<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
	<?php } ?>
	<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
	<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
	<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
	<link href="catalog/view/theme/customtheme/stylesheet/stylesheet.css" rel="stylesheet">
	<link href="catalog/view/theme/customtheme/stylesheet/menu.css" rel="stylesheet">
	<link href="catalog/view/theme/customtheme/stylesheet/cart.css" rel="stylesheet">
	<link href="catalog/view/theme/customtheme/stylesheet/header.css" rel="stylesheet">
	<link href="catalog/view/theme/customtheme/stylesheet/sidebar.css" rel="stylesheet">
	<link href="catalog/view/theme/customtheme/stylesheet/home.css" rel="stylesheet">
	<link href="catalog/view/theme/customtheme/stylesheet/content.css" rel="stylesheet">
	<link href="catalog/view/theme/customtheme/bxSlider/bxSlider.css" rel="stylesheet">
	<link href="catalog/view/theme/customtheme/stylesheet/listproduct.css" rel="stylesheet">
	<link href="catalog/view/theme/customtheme/stylesheet/footer.css" rel="stylesheet">
	/*<!-- <script src="catalog/view/javascript/jquery/colorbox/jquery.colorbox.js" type="text/javascript"></script> -->*/
	<script src="catalog/view/javascript/bxSlider.js" type="text/javascript"></script>
	<script src="catalog/view/javascript/jquery.bxSlider.js" type="text/javascript"></script>
	<?php foreach ($styles as $style) { ?>
	<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
	<?php } ?>
	<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
	<?php foreach ($scripts as $script) { ?>
	<script src="<?php echo $script; ?>" type="text/javascript"></script>
	<?php } ?>
	<?php echo $google_analytics; ?>
</head>
<body class="<?php echo $class; ?>">
	<div id="taskbar">
		<div class="taskbar_arrow">
			<div class="tbleft"></div>
			<div class="tbright"></div>
		</div>
		<div class="taskbar">
			<div class="left">
				<a class="tba" href="http://2tmobile.com/info/about/"><span class="tspan tabout"></span>Giới thiệu</a>
				<a class="tba hethongcuahang cboxElement" onclick="http://2tmobile.com/info/showroom/"><span class="tspan tshowroom"></span>Hệ thống cửa hàng</a>

				<a class="tba tright" href="http://2tmobile.com/info/contact/"><span class="tspan tcontact"></span>Liên hệ</a>
			</div>
			<div class="right">
				Tư vấn bán hàng / kỹ thuật: <b>0989.222.444</b> / <b>0933.888.405</b> 	
			</div>
		</div>
	</div>
	<div class="container">
		<header id="header">
			<div class="header">
				
				<div class="row">
					<div class="div1">
						<div id="logo">
							<?php if ($logo) { ?>
							<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
							<?php } else { ?>
							<h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
							<?php } ?>
						</div>
					</div>
					<div class="div2">


						<h1 class="htitle">Hệ thống cửa hàng bán điện thoại, máy tính bảng uy tín giá tốt</h1>
						<div class="hdshowroom"><span>2Tmobile 1:</span> <font>154bis Trần Quang Khải, P.Tân Định, Q.1 TP.HCM</font></div>
						<div class="hdshowroom"><span>2Tmobile 2:</span> <font>641 Lê Hồng Phong, P.10, Q.10, TP.HCM</font></div>
						<div class="hdshowroom"><span>Chào hàng/Phân phối giá sỉ:</span> <b>0938.871.216</b> <font>Mr.Hải</font></div>

					</div>
					<div class="div0">
						<?php echo $search; ?>
					</div>
				</div>

			</div>
		</header>
	</div>
	
	<?php if ($categories) { ?>
	<div class="container">
		<nav class="menu" >
			<ul id="menu">
				<li class="mliTop home select active">
					<a class="maTop" href="http://localhost/Training201410/opencart-2.0.0.0/upload/index.php?route=common/home"></a>
					<?php foreach ($categories as $category) { ?>
					<?php if ($category['children']) {?>
					<li class="mliTop">
						<a href="<?php echo $category['href']?>" class="maTop"><?php echo $category['name'];?></a>
						<div class="dropdown catid_">
							<div class="mliImage"></div>

							
							<?php foreach($category['children'] as $child){?>
							<div class="col_1">
								<div class="col_title">
									<a href="<?php echo $child['href'];?>"><?php echo $child['name'];?></a>
									
								</div>
								<ul class="simple">

									<?php foreach(array_chunk($child['sub_children'], 3) as $subchildren) { ?>
									<?php foreach($subchildren as $subchild){?>
									<li>
										<a href="<?php echo $subchild['href'];?>"><?php echo $subchild['name'];?></a>
									</li>
									<?php } ?>
									<?php } ?>
								</ul>
							</div>
							<?php } ?>

						</div>
					</li>
					<?php }  else { ?>	
					<li class="mliTop"><a href="<?php echo $category['href']; ?>" class="maTop"><?php echo $category['name']; ?></a></li>
					<?php } ?>
					<?php } ?>
				</li>
			</ul>
		</nav>
		<script language="javascript"> 
			$('#menu li.mliTop').mouseenter(function() {
				$('#menu li.mliTop').removeClass('select');
			});
			$('#menu li.mliTop').mouseleave(function() {
				$('#menu .active').addClass('select');
			});
			$('.simple li').mouseenter(function() {
				$('.simple li').removeClass('select');
			});
			$('.simple li').mouseleave(function() {
				$('.simple .active').addClass('select');
			});
		</script>

	</div>
	<?php } ?>
