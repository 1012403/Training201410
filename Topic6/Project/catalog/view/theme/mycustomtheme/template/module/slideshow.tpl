<link href="catalog/view/theme/mycustomtheme/stylesheet/home.css" type="text/css" rel="stylesheet">
<link href="catalog/view/theme/mycustomtheme/stylesheet/listproduct.css" type="text/css" rel="stylesheet">

<script src="catalog/view/javascript/jquery/jquery.bxSlider.js" type="text/javascript"></script>
<link href="catalog/view/theme/mycustomtheme/stylesheet/bxSlider.css" rel="stylesheet">
<div id="content" class="no_right">
  <div id="slideshow<?php echo $module; ?>" class="slideshow">
    <div class="sl_arrow_tl"></div>
    <div class="sl_arrow_tr"></div>
    <div class="sl_arrow_bl"></div>
    <div class="sl_arrow_br"></div>
    <script type="text/javascript">
      $(document).ready(function(){
      $('#slider1').bxSliderHome({
      mode: 'vertical',
      controls: false,
      pager: true,
      autoHover: true,
      pagerHover: true
      });
      });
    </script> 

    <ul id="slider1" style="position: relative; ">
      <?php foreach ($banners as $banner) { ?>
      <?php if ($banner['link']) { ?>
      <li class="paper" style="list-style: outside none none; height: 350px;">
        <a href="<?php echo $banner['link']; ?>">
          <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>">
        </a>
      </li>
      <?php } else { ?>
      <li style="list-style: outside none none; height: 350px;">          
          <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>">
      </li>
      <?php } ?>
      <?php } ?>
    </ul>       
  </div>

  <div class="slidebottom">
    <div class="slide1">
      <script type="text/javascript">
          $(document).ready(function(){
          $('#slide1').bxSlider({
          speed: 1000,
          pause: 4000,
          mode: 'fade',
          controls: false,
          autoStart: true
          });
          });
      </script>
      <ul id="slide1">
                <li>
                    <a href="http://2tmobile.com/dich-vu/sua-chua-iphone.html"><img alt="Sửa chữa iPhone, iPad uy t&iacute;n" src='http://2tmobile.com/image/imgdata/banner/banner_nho/suaip_small.jpg' /></a>
                  </li>
                <li>
                    <a href="http://2tmobile.com/dich-vu/mua-dien-thoai-tra-gop.html"><img alt="Mua trả g&oacute;p" src='http://2tmobile.com/image/data/banner/tragop.jpg' /></a>
                  </li>
            </ul>
    </div>
    <div class="slide2">
      <script type="text/javascript">
          $(document).ready(function(){
          $('#slide2').bxSlider({
          speed: 1000,
          pause: 4000,
          mode: 'fade',
          controls: false,
          autoStart: true
          });
          });
      </script>
      <ul id="slide2">
                <li>
                    <a href="http://2tmobile.com/san-pham-khuyen-mai/"><img alt="Khuyến m&atilde;i gi&aacute; sốc mỗi tuần" src='http://2tmobile.com/image/imgdata/banner/banner_nho/gia-san.jpg' /></a>
                  </li>
                <li>
                    <a href="http://2tmobile.com/dich-vu/thu-iphone-cu-gia-cao.html"><img alt="Thu may cu" src='http://2tmobile.com/image/data/banner/thucudoimoi.jpg' /></a>
                  </li>
            </ul>
    </div>
    <div class="slide3">
      <script type="text/javascript">
          $(document).ready(function(){
          $('#slide3').bxSlider({
          speed: 1000,
          pause: 4000,
          mode: 'fade',
          controls: false,
          autoStart: true
          });
          });
      </script>
      <ul id="slide3">
                <li>
                    <a href="http://2tmobile.com/news/1278/iphone-6-19-09-co-hang-giam-gia-1-trieu.html"><img alt="iPhone 6 iPhone 6 Plus 19/09 c&oacute; h&agrave;ng" src='http://2tmobile.com/image/imgdata/cam-ket-ip6.jpg' /></a>
                  </li>
                <li>
                    <a href="http://2tmobile.com/dich-vu/thu-mua-iphone-6-6-plus.html"><img alt="Thu iPhone 6" src='http://2tmobile.com/image/imgdata/banner/banner_nho/thuiphone6.jpg' /></a>
                  </li>
            </ul>
    </div>
  </div>
</div>




