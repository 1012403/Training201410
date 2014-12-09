<?php echo $header; ?>
<div id="content" class="no_right"><?php echo $content_top; ?><?php echo $content_bottom; ?></div>
<div class="hotproduct no_right" id="content" style="width:60%;">
    <div class="tophp">
      <div class="left"></div>
      <div class="right"></div>
      <div class="center">
        <h2 class="h2top" itemprop="name">Sản phẩm giá gốc</h2>
      </div>
    </div>
    <div class="middlehp">
      <div class="hp_big">
        <?php $count = 0; ?>
        <?php foreach ($products as $product){ ?> 
        <?php foreach ($product['attribute_groups'] as $attribute_groups) { ?>
        <?php foreach ($attribute_groups['attribute'] as $attribute) { ?>
        <?php  if($attribute['name'] == "Type" && $attribute['text'] == "Sản phẩm giá gốc" && $count == 0) {
          $image = "http://localhost/Training201410/opencart-2.0.0.0/upload/image/".$product['image'];  ?>
          <span style="background:#0066FF;color:#FFF" class="icon_label lbid2">Gift</span>                
          <div class="hb_image">
            <a href="http://2tmobile.com/iphone-5s.html">
              <img alt="<?php echo $product['name'];?>" src="<?php echo $image;?>">
            </a>
          </div>
          <div class="hb_name">
            <a href="http://2tmobile.com/iphone-5s.html"><?php echo $product['name']; ?></a>
            <div class="hb_opt">(16GB / 32GB / 64GB)</div>        
          </div>
          <div class="hb_price">
            <span class="price"><font><span class="textp">Giá từ </span><?php echo $product['price'];?></font></span><br>
          </div>
          <div class="hb_promotion">
            Khuyến mãi trị giá đến <b>1.500.000đ</b>          
          </div>
          <div class="hb_buynow"><span class="hs_star"></span><a href="http://2tmobile.com/iphone-5s.html">Xem ngay</a></div>
          <div class="hb_desc">
            <a href="http://2tmobile.com/iphone-5s.html" class="hb_ahref">
              <span class="bdesc">
               <?php foreach ($product['attribute_groups'] as $attribute_groups) { ?>
               <?php foreach ($attribute_groups['attribute'] as $attribute) { ?>
               <?php if ($attribute['name'] != 'type') {?>
               <p><?php echo $attribute['name']; echo ":"; echo $attribute['text']; ?></p>
               <?php } ?>
               <?php } ?>
               <?php } ?>
             </span>
           </a>
         </div>
         <?php $count = $count +1;
         break; }?>
         <?php  } ?>
         <?php  } ?>
         <?php } ?>
       </div>
       <div class="hp_small">
        <ul>
          <?php $count = 1; ?>
          <?php foreach ($products as $product){ ?> 
          <?php foreach ($product['attribute_groups'] as $attribute_groups) { ?>
          <?php foreach ($attribute_groups['attribute'] as $attribute) { ?>
          <?php  if($attribute['name'] == "Type" && $attribute['text'] == "Sản phẩm giá gốc") {
            $image = "http://localhost/Training201410/opencart-2.0.0.0/upload/image/".$product['image'];  ?>
            <li class="hs_<?php echo $count;?>">
              <span style="background:#0066FF;color:#FFF" class="icon_label lbid2">Gift</span>           
              <div class="hs_image">
                <a href="http://2tmobile.com/iphone-5.html"><img  alt="<?php echo $product['name'];?>" src="<?php echo $image;?>"></a>
              </div>
              <h3 class="hs_name">
               <a href="http://2tmobile.com/iphone-5.html">
                 <?php echo $product['name'];?>
               </a></h3>
               <div class="hs_opt">(16GB / 32GB / 64GB)</div>        
               <div class="hs_promotion">
                Khuyến mãi trị giá đến <b>1.500.000đ</b>                 </div>
                <div class="hs_price">
                  <span class="price"><span class="hs_star"></span><font><span class="textp">Giá từ </span><?php echo $product['price'];?></font></span>
                </div>
                <div class="hs_bdesc">
                  <a href="http://2tmobile.com/iphone-5.html" class="hs_bahref">
                   <span class="lbdesc">
                    <?php foreach ($product['attribute_groups'] as $attribute_groups) { ?>
                    <?php foreach ($attribute_groups['attribute'] as $attribute) { ?>
                    <?php if ($attribute['name'] != 'type') {?>

                    <p><?php echo $attribute['name']; echo ":"; echo $attribute['text']; ?></p>
                    <?php } ?>
                    <?php } ?>
                    <?php } ?>
                  </span>
                </a>
              </div>
            </li>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php $count = $count + 1; } ?>

          </ul>
        </div>
      </div>
    </div>

<footer id="footer">
  <div class="div0">
    <div class="f_showroom">
      <div class="f_top">
        <span class="f_top_name">Hệ thống cửa hàng</span>
      </div>
      <div class="f_middle">
        <div class="footer_sr">
          <div class="map_contact">
            <div class="info_contact">
              <p class="chinhanh"><font>2Tmobile 1</font></p>
              <p class="diachi"><font>154bis Trần Quang Khải, P.TĐ, Q.1, Tp.HCM</font></p>
              <p class="dienthoai">Điện thoại: <span class="telephone">08.3526.8889</span></p>
            </div>
          </div>

          <div class="view_map"><a onclick="info/showroom/&amp;showroom_id=1" class="colorbox cboxElement">Click vào để xem bản đồ</a></div>
        </div>

        <div class="footer_sr">
          <div class="map_contact">
            <div class="info_contact">
              <p class="chinhanh"><font>2Tmobile 2</font></p>
              <p class="diachi"><font>641 Lê Hồng Phong, P.10, Q.10, Tp.HCM</font></p>
              <p class="dienthoai">Điện thoại: <span class="telephone">08.6674.9554</span></p>
            </div>
          </div>

          <div class="view_map"><a onclick="info/showroom/&amp;showroom_id=2" class="colorbox cboxElement">Click vào để xem bản đồ</a></div>
        </div>    </div>
      </div>

      <div class="f_info">
        <div class="f_top">
          <span class="f_top_name">Thông tin bán hàng</span>
        </div>
        <div class="f_middle">
          <div id="news">
            <ul>
              <li><a href="http://2tmobile.com/info/60/huong-dan-mua-hang-chuyen-khoan-ngan-hang.html">Hướng dẫn mua hàng: Chuyển khoản ngân hàng</a></li>
              <li><a href="http://2tmobile.com/mua-hang-tu-xa">Hướng dẫn khách hàng mua hàng từ xa</a></li>
            </ul>
          </div>
        </div>
      </div>

      <div class="f_video">
        <script type="text/javascript">
          $(document).ready(function(){
            $('#videosp').bxSlider({
              speed: 250,
              autoStart: false
            });
          });
        </script>
        <div class="f_top">
          <span class="f_top_name">Video sản phẩm</span>
        </div>
        <div class="f_middle">
          <div style="width:337px; position:relative;" class="bx-wrapper"><div style="position:relative; overflow:hidden; width:337px;" class="bx-window"><ul id="videosp" style="width: 999999px; position: relative; left: -337px;"><li style="width: 337px; float: left; list-style: outside none none;">
            <a rel="video" class="colorbox cboxElement" onclick="http://2tmobile.com/index.php?route=product/video&amp;youtube_id=CBxy5x8MZt0" title="Hướng dẫn chi tiết sử dụng iTunes 11.1 chép nhạc và Video clip vào iPhone">
              <div class="vsimage"><img src="http://i2.ytimg.com/vi/CBxy5x8MZt0/mqdefault.jpg"></div>
              <div class="vsname">Hướng dẫn chi tiết sử dụng iTunes 11.1 chép nhạc và Video clip vào iPhone</div>
              <div class="vsplay"></div>
            </a>
          </li>
          <li style="width: 337px; float: left; list-style: outside none none;" class="pager">
            <a rel="video" class="colorbox cboxElement" onclick="http://2tmobile.com/index.php?route=product/video&amp;youtube_id=u5X5cV-4LRo" title="Official iPhone 5 Trailer">
              <div class="vsimage"><img src="http://i2.ytimg.com/vi/u5X5cV-4LRo/mqdefault.jpg"></div>
              <div class="vsname">Official iPhone 5 Trailer</div>
              <div class="vsplay"></div>
            </a>
          </li>
          <li style="width: 337px; float: left; list-style: outside none none;" class="pager">
            <a rel="video" class="colorbox cboxElement" onclick="http://2tmobile.com/index.php?route=product/video&amp;youtube_id=OmTBV9H7dbA" title="iPhone 5 vs. iPhone 4S">
              <div class="vsimage"><img src="http://i2.ytimg.com/vi/OmTBV9H7dbA/mqdefault.jpg"></div>
              <div class="vsname">iPhone 5 vs. iPhone 4S</div>
              <div class="vsplay"></div>
            </a>
          </li>
          <li style="width: 337px; float: left; list-style: outside none none;" class="pager">
            <a rel="video" class="colorbox cboxElement" onclick="http://2tmobile.com/index.php?route=product/video&amp;youtube_id=lMfBWROgzHA" title="iPhone 5 Review">
              <div class="vsimage"><img src="http://i2.ytimg.com/vi/lMfBWROgzHA/mqdefault.jpg"></div>
              <div class="vsname">iPhone 5 Review</div>
              <div class="vsplay"></div>
            </a>
          </li>
          <li style="width: 337px; float: left; list-style: outside none none;" class="pager">
            <a rel="video" class="colorbox cboxElement" onclick="http://2tmobile.com/index.php?route=product/video&amp;youtube_id=-2hWHYfjlxU" title="Đập hộp iPhone 5s tại 2T Mobile">
              <div class="vsimage"><img src="http://i2.ytimg.com/vi/-2hWHYfjlxU/mqdefault.jpg"></div>
              <div class="vsname">Đập hộp iPhone 5s tại 2T Mobile</div>
              <div class="vsplay"></div>
            </a>
          </li>
          <li style="width: 337px; float: left; list-style: outside none none;" class="pager">
            <a rel="video" class="colorbox cboxElement" onclick="http://2tmobile.com/index.php?route=product/video&amp;youtube_id=CBxy5x8MZt0" title="Hướng dẫn chi tiết sử dụng iTunes 11.1 chép nhạc và Video clip vào iPhone">
              <div class="vsimage"><img src="http://i2.ytimg.com/vi/CBxy5x8MZt0/mqdefault.jpg"></div>
              <div class="vsname">Hướng dẫn chi tiết sử dụng iTunes 11.1 chép nhạc và Video clip vào iPhone</div>
              <div class="vsplay"></div>
            </a>
          </li>
        </ul></div><a class="bx-prev hide" href="">prev</a><a class="bx-next" href="">next</a></div>
      </div>
    </div>
    <div style="clear:both;"></div>
  </div>
  <div class="div1">
    <div class="powered">Copyright &copy; 2014 <a target="_blank" href="">2Tmobile.com</a>. All rights reserved</div>
    <div class="menufooter">
      <a href="http://2tmobile.com/">Trang chủ</a>
      <a href="http://2tmobile.com/info/about/">Giới thiệu</a>
      <a href="http://2tmobile.com/news/">Tin tức</a>
      <a href="http://2tmobile.com/product/special/">Khuyến mãi</a>
      <a href="http://2tmobile.com/info/contact/">Liên hệ</a>
      <a href="http://2tmobile.com/info/sitemap/" class="right">Sitemap</a>
    </div>
  </div>

  <div class="hotkeywords"><h3>&nbsp;<a title="điện thoại iphone 6 chính hãng" href="http://2tmobile.com/dien-thoai/iphone-6.html">iPhone 6</a>&nbsp;<a href="http://2tmobile.com/dien-thoai/iphone-6-plus.html">iphone 6 plus</a>&nbsp;<a title="iphone 4s chính hãng 2014" href="http://2tmobile.com/iPhone-4S.html">iPhone 4s</a>&nbsp;<a title="iphone 4 giá rẻ" href="http://2tmobile.com/Iphone-4.html">iPhone 4</a>&nbsp;<a title="iphone 5 chính hãng" href="http://2tmobile.com/iphone-5.html">iPhone 5</a>&nbsp;<a title="máy tính bảng ipad mini 2" href="http://2tmobile.com/may-tinh-bang/ipad-mini-2.html">ipad mini 2</a>&nbsp;<a title="máy tính bảng ipad air" href="http://2tmobile.com/may-tinh-bang/ipad-air.html">ipad&nbsp;air</a>&nbsp;<a title="điện thoại iPhone 5s 2014" href="http://2tmobile.com/iphone-5s.html">iPhone 5s</a>&nbsp;<a title="máy tính bảng ipad 4" href="http://2tmobile.com/may-tinh-bang/ipad-4.html">ipad 4</a></h3>
  </div>
  
  <div style="clear:both;"></div>


  <div class="ftotop">
    <a title="Lên trên" id="tbtop" style="display: block;"></a>
    <script type="text/javascript">$(function(){$(window).scroll(function(){if($(this).scrollTop() != 0){$('#tbtop').fadeIn();}else{$('#tbtop').fadeOut();}});$('#tbtop').click(function(){$('body,html').animate({scrollTop:0},800);});});</script>
  </div>
</footer>
</div>


<!-- 
  
    <div id="column_right">
      <style type="text/css">
        .box_menu a.ci70 {
          background-color:#9f005d;     background-image:url(http://2tmobile.com/image/data/suachua1234.png);
        }
        .box_menu a.ci69 {
          background-color:#0084cc;     background-image:url(http://2tmobile.com/image/data/system/icon_appstore.png);
        }
        .box_menu a.ci68 {
          background-color:#197b30;     background-image:url(http://2tmobile.com/image/data/system/icon_appstore.png);
        }
        .box_menu a.ci71 {
          background-color:#0f63a3;     background-image:url(http://2tmobile.com/image/data/hoptac.png);
        }
      </style>
      <div class="box_menu">
        <a class="ci70" href="http://2tmobile.com/dich-vu/sua-chua-iphone.html"><span>Dịch Vụ Sửa Chữa</span></a>
        <a class="ci69" href="http://2tmobile.com/info/69/cai-dat-ios-7-mien-phi.html"><span>Cài Đặt iOS 7 Miễn Phí</span></a>
        <a class="ci68" href="http://2tmobile.com/info/68/chep-game-chep-nhac.html"><span>Chép Game - Chép Nhạc</span></a>
        <a class="ci71" href="http://2tmobile.com/info/71/che-do-bao-hanh.html"><span>Chế độ bảo hành</span></a>
      </div>
    </div>

    <div id="content">
      <div class="top">
        <div class="left"></div>
        <div class="right"></div>
        <div class="center">
          <h2 class="h2top">Sản phẩm khuyến mãi</h2>
        </div>
      </div>
      <div>
        <div class="middle product">
          <ul class="list">
            <?php foreach ($products as $product){ ?> 
            <?php foreach ($product['attribute_groups'] as $attribute_groups) { ?>
            <?php foreach ($attribute_groups['attribute'] as $attribute) { ?>
            <?php  if($attribute['name'] == "Type" && $attribute['text'] == "Sản phẩm khuyến mãi") {
              $image = "http://localhost/Training201410/opencart-2.0.0.0/upload/image/".$product['image'];  ?>
              <li>
                <span class="icon label lbid2" style="background:#0066FF;color:#FFF">GIFT</span>
                <div class="list_desc">
                  <div class="list_image">
                    <a href="#">
                      <img style = "heigh:130px; width:100px" src="<?php echo $image;?>" alt="<?php echo $product['name'];?>">
                    </a>
                  </div>
                  <h3 class="list_name">
                    <a href="#"><?php echo $product['name'];?></a>
                  </h3>
                  <div class="list_opt">(16GB / 32Gb / 64GB)</div>
                  <div class="list_price">
                    <span class="price">
                      <span class="textp">Giá từ</span>
                      <?php echo $product['price']; ?>
                    </span>
                  </div>
                  <div class="list_bdesc">
                    <a href="#" class="lbdesc_href">
                     <?php foreach ($product['attribute_groups'] as $attribute_groups) { ?>
                     <?php foreach ($attribute_groups['attribute'] as $attribute) { ?>
                     <?php if ($attribute['name'] != 'Type') {?>
                     <p><?php echo $attribute['name']; echo ":"; echo $attribute['text']; ?></p>
                     <?php } ?>
                     <?php } ?>
                     <?php } ?>
                   </a>
                 </div>
               </div>
             </li>
             <?php } ?>
             <?php } ?>
             <?php } ?>
             <?php } ?>
           </ul>
         </div>
       </div>
     </div>

     <div id="content">
      <div class="top">
        <div class="left"></div>
        <div class="right"></div>
        <div class="center">
          <h2 class="h2top">Sản phẩm sắp ra mắt</h2>
        </div>
      </div>
      <div>
        <div class="middle product">
          <ul class="list">
            <?php foreach ($products as $product){ ?> 
            <?php foreach ($product['attribute_groups'] as $attribute_groups) { ?>
            <?php foreach ($attribute_groups['attribute'] as $attribute) { ?>
            <?php  if($attribute['name'] == "Type" && $attribute['text'] == "Sản phẩm sắp ra mắt") {
              $image = "http://localhost/Training201410/opencart-2.0.0.0/upload/image/".$product['image'];  ?>
              <li>
                <span class="icon label lbid2" style="background:#0066FF;color:#FFF">GIFT</span>
                <div class="list_desc">
                  <div class="list_image">
                    <a href="#">
                      <img style = "heigh:130px; width:100px" src="<?php echo $image;?>" alt="<?php echo $product['name'];?>">
                    </a>
                  </div>
                  <h3 class="list_name">
                    <a href="#"><?php echo $product['name'];?></a>
                  </h3>
                  <div class="list_opt">(16GB / 32Gb / 64GB)</div>
                  <div class="list_price">
                    <span class="price">
                      <span class="textp">Giá từ</span>
                      <?php echo $product['price']; ?>
                    </span>
                  </div>
                  <div class="list_bdesc">
                    <a href="#" class="lbdesc_href">
                     <?php foreach ($product['attribute_groups'] as $attribute_groups) { ?>
                     <?php foreach ($attribute_groups['attribute'] as $attribute) { ?>
                     <?php if ($attribute['name'] != 'Type') {?>
                     <p><?php echo $attribute['name']; echo ":"; echo $attribute['text']; ?></p>
                     <?php } ?>
                     <?php } ?>
                     <?php } ?>
                   </a>
                 </div>
               </div>
             </li>
             <?php } ?>
             <?php } ?>
             <?php } ?>
             <?php } ?>
           </ul>
         </div>
       </div>
     </div>
     <footer id="footer">
      <div class="div0">
        <div class="f_showroom">
          <div class="f_top">
            <span class="f_top_name">Hệ thống cửa hàng</span>
          </div>
          <div class="f_middle">
            <div class="footer_sr">
              <div class="map_contact">
                <div class="info_contact">
                  <p class="chinhanh"><font>2Tmobile 1</font></p>
                  <p class="diachi"><font>154bis Trần Quang Khải, P.TĐ, Q.1, Tp.HCM</font></p>
                  <p class="dienthoai">Điện thoại: <span class="telephone">08.3526.8889</span></p>
                </div>
              </div>

              <div class="view_map"><a onclick="info/showroom/&amp;showroom_id=1" class="colorbox cboxElement">Click vào để xem bản đồ</a></div>
            </div>

            <div class="footer_sr">
              <div class="map_contact">
                <div class="info_contact">
                  <p class="chinhanh"><font>2Tmobile 2</font></p>
                  <p class="diachi"><font>641 Lê Hồng Phong, P.10, Q.10, Tp.HCM</font></p>
                  <p class="dienthoai">Điện thoại: <span class="telephone">08.6674.9554</span></p>
                </div>
              </div>

              <div class="view_map"><a onclick="info/showroom/&amp;showroom_id=2" class="colorbox cboxElement">Click vào để xem bản đồ</a></div>
            </div>    </div>
          </div>
          
          <div class="f_info">
            <div class="f_top">
              <span class="f_top_name">Thông tin bán hàng</span>
            </div>
            <div class="f_middle">
              <div id="news">
                <ul>
                  <li><a href="http://2tmobile.com/info/60/huong-dan-mua-hang-chuyen-khoan-ngan-hang.html">Hướng dẫn mua hàng: Chuyển khoản ngân hàng</a></li>
                  <li><a href="http://2tmobile.com/mua-hang-tu-xa">Hướng dẫn khách hàng mua hàng từ xa</a></li>
                </ul>
              </div>
            </div>
          </div>
          
          <div class="f_video">
            <script type="text/javascript">
              $(document).ready(function(){
                $('#videosp').bxSlider({
                  speed: 250,
                  autoStart: false
                });
              });
            </script>
            <div class="f_top">
              <span class="f_top_name">Video sản phẩm</span>
            </div>
            <div class="f_middle">
              <div style="width:337px; position:relative;" class="bx-wrapper"><div style="position:relative; overflow:hidden; width:337px;" class="bx-window"><ul id="videosp" style="width: 999999px; position: relative; left: -337px;"><li style="width: 337px; float: left; list-style: outside none none;">
                <a rel="video" class="colorbox cboxElement" onclick="http://2tmobile.com/index.php?route=product/video&amp;youtube_id=CBxy5x8MZt0" title="Hướng dẫn chi tiết sử dụng iTunes 11.1 chép nhạc và Video clip vào iPhone">
                  <div class="vsimage"><img src="http://i2.ytimg.com/vi/CBxy5x8MZt0/mqdefault.jpg"></div>
                  <div class="vsname">Hướng dẫn chi tiết sử dụng iTunes 11.1 chép nhạc và Video clip vào iPhone</div>
                  <div class="vsplay"></div>
                </a>
              </li>
              <li style="width: 337px; float: left; list-style: outside none none;" class="pager">
                <a rel="video" class="colorbox cboxElement" onclick="http://2tmobile.com/index.php?route=product/video&amp;youtube_id=u5X5cV-4LRo" title="Official iPhone 5 Trailer">
                  <div class="vsimage"><img src="http://i2.ytimg.com/vi/u5X5cV-4LRo/mqdefault.jpg"></div>
                  <div class="vsname">Official iPhone 5 Trailer</div>
                  <div class="vsplay"></div>
                </a>
              </li>
              <li style="width: 337px; float: left; list-style: outside none none;" class="pager">
                <a rel="video" class="colorbox cboxElement" onclick="http://2tmobile.com/index.php?route=product/video&amp;youtube_id=OmTBV9H7dbA" title="iPhone 5 vs. iPhone 4S">
                  <div class="vsimage"><img src="http://i2.ytimg.com/vi/OmTBV9H7dbA/mqdefault.jpg"></div>
                  <div class="vsname">iPhone 5 vs. iPhone 4S</div>
                  <div class="vsplay"></div>
                </a>
              </li>
              <li style="width: 337px; float: left; list-style: outside none none;" class="pager">
                <a rel="video" class="colorbox cboxElement" onclick="http://2tmobile.com/index.php?route=product/video&amp;youtube_id=lMfBWROgzHA" title="iPhone 5 Review">
                  <div class="vsimage"><img src="http://i2.ytimg.com/vi/lMfBWROgzHA/mqdefault.jpg"></div>
                  <div class="vsname">iPhone 5 Review</div>
                  <div class="vsplay"></div>
                </a>
              </li>
              <li style="width: 337px; float: left; list-style: outside none none;" class="pager">
                <a rel="video" class="colorbox cboxElement" onclick="http://2tmobile.com/index.php?route=product/video&amp;youtube_id=-2hWHYfjlxU" title="Đập hộp iPhone 5s tại 2T Mobile">
                  <div class="vsimage"><img src="http://i2.ytimg.com/vi/-2hWHYfjlxU/mqdefault.jpg"></div>
                  <div class="vsname">Đập hộp iPhone 5s tại 2T Mobile</div>
                  <div class="vsplay"></div>
                </a>
              </li>
              <li style="width: 337px; float: left; list-style: outside none none;" class="pager">
                <a rel="video" class="colorbox cboxElement" onclick="http://2tmobile.com/index.php?route=product/video&amp;youtube_id=CBxy5x8MZt0" title="Hướng dẫn chi tiết sử dụng iTunes 11.1 chép nhạc và Video clip vào iPhone">
                  <div class="vsimage"><img src="http://i2.ytimg.com/vi/CBxy5x8MZt0/mqdefault.jpg"></div>
                  <div class="vsname">Hướng dẫn chi tiết sử dụng iTunes 11.1 chép nhạc và Video clip vào iPhone</div>
                  <div class="vsplay"></div>
                </a>
              </li>
            </ul></div><a class="bx-prev hide" href="">prev</a><a class="bx-next" href="">next</a></div>
          </div>
        </div>
        <div style="clear:both;"></div>
      </div>
      <div class="div1">
        <div class="powered">Copyright &copy; 2014 <a target="_blank" href="">2Tmobile.com</a>. All rights reserved</div>
        <div class="menufooter">
          <a href="http://2tmobile.com/">Trang chủ</a>
          <a href="http://2tmobile.com/info/about/">Giới thiệu</a>
          <a href="http://2tmobile.com/news/">Tin tức</a>
          <a href="http://2tmobile.com/product/special/">Khuyến mãi</a>
          <a href="http://2tmobile.com/info/contact/">Liên hệ</a>
          <a href="http://2tmobile.com/info/sitemap/" class="right">Sitemap</a>
        </div>
      </div>

      <div class="hotkeywords"><h3>&nbsp;<a title="điện thoại iphone 6 chính hãng" href="http://2tmobile.com/dien-thoai/iphone-6.html">iPhone 6</a>&nbsp;<a href="http://2tmobile.com/dien-thoai/iphone-6-plus.html">iphone 6 plus</a>&nbsp;<a title="iphone 4s chính hãng 2014" href="http://2tmobile.com/iPhone-4S.html">iPhone 4s</a>&nbsp;<a title="iphone 4 giá rẻ" href="http://2tmobile.com/Iphone-4.html">iPhone 4</a>&nbsp;<a title="iphone 5 chính hãng" href="http://2tmobile.com/iphone-5.html">iPhone 5</a>&nbsp;<a title="máy tính bảng ipad mini 2" href="http://2tmobile.com/may-tinh-bang/ipad-mini-2.html">ipad mini 2</a>&nbsp;<a title="máy tính bảng ipad air" href="http://2tmobile.com/may-tinh-bang/ipad-air.html">ipad&nbsp;air</a>&nbsp;<a title="điện thoại iPhone 5s 2014" href="http://2tmobile.com/iphone-5s.html">iPhone 5s</a>&nbsp;<a title="máy tính bảng ipad 4" href="http://2tmobile.com/may-tinh-bang/ipad-4.html">ipad 4</a></h3>
      </div>
      
      <div style="clear:both;"></div>


      <div class="ftotop">
        <a title="Lên trên" id="tbtop"></a>
        <script type="text/javascript">$(function(){$(window).scroll(function(){if($(this).scrollTop() != 0){$('#tbtop').fadeIn();}else{$('#tbtop').fadeOut();}});$('#tbtop').click(function(){$('body,html').animate({scrollTop:0},800);});});</script>
      </div>
    </footer>
  </div>
 -->