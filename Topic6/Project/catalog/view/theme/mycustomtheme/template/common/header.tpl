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


<!--<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>-->
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />

<link href="catalog/view/theme/mycustomtheme/stylesheet/stylesheet.css" rel="stylesheet">
<link href="catalog/view/theme/mycustomtheme/stylesheet/header.css" rel="stylesheet">
<link href="catalog/view/theme/mycustomtheme/stylesheet/menu.css" rel="stylesheet">
<link href="catalog/view/theme/mycustomtheme/stylesheet/cart.css" rel="stylesheet">
<link href="catalog/view/theme/mycustomtheme/stylesheet/sidebar.css" rel="stylesheet">
<link href="catalog/view/theme/mycustomtheme/stylesheet/content.css" rel="stylesheet">
<link href="catalog/view/theme/mycustomtheme/stylesheet/footer.css" rel="stylesheet">

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/tab.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/jquery.bxSlider.main.js" type="text/javascript"></script>
<link href="catalog/view/theme/mycustomtheme/stylesheet/colorbox.css" rel="stylesheet">
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-43818149-1', '2tmobile.com');
  ga('send', 'pageview');

</script>
<link href="catalog/view/theme/mycustomtheme/stylesheet/style.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>

<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body>
<div class=" fb_reset" id="fb-root"></div>

<div id="taskbar">
  <div class="taskbar_arrow">
  <div class="tbleft"></div>
  <div class="tbright"></div>
  </div>
  <div class="taskbar">
  <div class="left">
    <a href="http://2tmobile.com/info/about/" class="tba"><span class="tspan tabout"></span>Giới thiệu</a>
    <a onclick="http://2tmobile.com/info/showroom/" class="tba hethongcuahang cboxElement"><span class="tspan tshowroom"></span>Hệ thống cửa hàng</a>
<script type="text/javascript">
/*$(document).ready(function() {
  $('.hethongcuahang').colorbox({
    overlayClose: false,
    initialHeight: "540",
    initialWidth: "800",
    escKey: false,
    opacity: 0.5
  });*/
});
</script>
      <a href="http://2tmobile.com/info/contact/" class="tba tright"><span class="tspan tcontact"></span>Liên hệ</a>
  </div>
  <div class="right">
    Tư vấn bán hàng / kỹ thuật: <b>0989.222.444</b> / <b>0933.888.405</b>   </div>
  </div>
</div>
<div id="container">
    <header id="header">
          <div class="header">
          <div class="div0">
            <div class="search">
                    <input placeholder="nhập từ khóa tìm kiếm..." id="filter_keyword" onclick="this.value = '';" onkeydown="this.style.color = '000000'" type="text">
                    <a onclick="moduleSearch();" class="button_search"></a>
            </div>
          </div>  

          <div class="div1">    
            <div id="logo" class="logo"> <!--page class="logo" -->
                  <?php if ($logo) { ?>
                  <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
                  <?php } else { ?>
                  <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                  <?php } ?>
            </div>
          </div>
          
          <div class="div2">
                  <div class="htitle">Hệ thống cửa hàng bán điện thoại, máy tính bảng uy tín giá tốt</div>
                <div class="hdshowroom"><span>2Tmobile 1:</span> <font>154bis Trần Quang Khải, P.Tân Định, Q.1 TP.HCM</font></div>
            <div class="hdshowroom"><span>2Tmobile 2:</span> <font>641 Lê Hồng Phong, P.10, Q.10, TP.HCM</font></div>
            <div class="hdshowroom"><span>Chào hàng/Phân phối giá sỉ:</span> <b>0938.871.216</b> <font>Mr.Hải</font></div>
          </div>
          <div style="clear:both;"></div>
          </div>
    </header>

  <?php if ($categories) { ?>
    <nav class="menu">
      <ul id="menu">
        <li class="mliTop home select active"><a class="maTop" href="http://2tmobile.com/"></a></li>
        <?php foreach ($categories as $category) { ?>       
          <?php if ($category['children']) { ?>
          <li class="mliTop"><a class="maTop" href="http://2tmobile.com/dien-thoai/"><?php echo $category['name']; ?></a>
            <div class="dropdown catid_36">

              <div class="mliImage">
                <img src="catalog/view/theme/mycustomtheme/image/dien-thoai.jpg" alt="<?php echo $category['name']; ?>">
              </div>

              <?php foreach ($category['children'] as $child) { ?>
                
                <div class="col_1">
                  <div class="col_title"><a href="http://2tmobile.com/dien-thoai/"><?php if ($child['name'] == "Simple") 
                  echo $category['name']; else echo $child['name']; ?></a></div>
                  <ul class="simple">

                    <?php foreach ($child['children'] as $grand) { ?>
                          <li><a href="http://2tmobile.com/dien-thoai/iphone/"><?php echo $grand['name'] ?></a></li>
                    <?php } ?>

                  </ul>
                </div>
                
              
              <?php } ?> <!-- End foreach category[children] -->
            </div>
          </li>          
          <?php } ?> <!-- End if category[children] -->
        <?php } ?> <!-- End foreach categories -->
          <li class="mliTop mliRight">
            <a class="maTop" href="http://2tmobile.com/info/75/mua-hang-tra-gop.html">Trả góp</a>
            </li>
            <li class="mliTop mliRight">
            <a class="maTop" href="http://2tmobile.com/news/">Tin tức</a>
          </li>
      </ul>  
    </nav>
  <?php } ?> <!-- End if categories -->


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
