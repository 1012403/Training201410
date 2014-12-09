<?php echo $header; ?>
<div class="container" style="margin-left:10%;">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?>
  </div>
  <div class="hotproduct no_right" id="content" style="width:90%;">
   <div class="top">
    <div class="left" style="margin-left:1%"></div>
    <div class="right"></div>
    <div class="center" style="margin-right:83%;">
    <h2 class="h2top">Sản phẩm giá gốc</h2>
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
    <div id="column_right" style="margin-right:7%;">
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
      </div>    <script type="text/javascript">
      $(document).ready(function(){
        $('.sb_hotnews').bxSlider({
          speed: 250,
          autoStart: false
        });
      });
    </script>
    <div class="box news">
      <div class="right"></div>
      <div class="top"><div><span>Tin tức</span> mới</div></div>
      <div class="middle sb_news moinhat">
        <a href="http://2tmobile.com/news/" class="sb_xemthem">XEM THÊM</a>
        <div class="topnews">
          <a href="http://2tmobile.com/news/1595/iphone-5-con-hang-moi-chua-active-hay-khong.html">
            <div class="tn_image"><img alt="iPhone 5 còn hàng mới chưa active hay không " src="http://2tmobile.com/image/cache/upload/news/2014/12/6/1595/1595_img1-220x164.jpg"></div>
            <div class="tn_desc">
              <span class="tn_name">iPhone 5 còn hàng mới chưa active hay không </span>
              <span class="tn_date_added"> - 04:21PM 06/12/2014</span>      </div>
            </a>
          </div>
          <div style="width:218px; position:relative;" class="bx-wrapper"><div style="position:relative; overflow:hidden; width:218px;" class="bx-window"><ul class="sb_hotnews" style="width: 999999px; position: relative; left: -218px;"><li style="width: 218px; float: left; list-style: outside none none;"><ul>
            <li>
              <a href="http://2tmobile.com/news/1585/cach-tai-game-tu-appstore-cho-iphone-6-6-plus.html">
                <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/12/4/1585/1585_img1-68x68.jpg" alt="Cách tải game từ Appstore cho iPhone 6 / 6 Plus"></div>
                <div class="sn_name">Cách tải game từ Appstore cho iPhone 6 / 6 Plus</div>
                <div class="sn_date_added">02:40PM 04/12/2014</div>         </a>
              </li>
              <li>
                <a href="http://2tmobile.com/news/1584/facetime-tren-ipad-co-mat-tien-de-su-dung-hay-khong.html">
                  <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/12/4/1584/1584_img1-68x68.jpg" alt="Facetime trên iPad có mất tiền để sử dụng hay không"></div>
                  <div class="sn_name">Facetime trên iPad có mất tiền để sử dụng hay không</div>
                  <div class="sn_date_added">02:37PM 04/12/2014</div>         </a>
                </li>
                <li>
                  <a href="http://2tmobile.com/news/1583/ipad-4-choi-duoc-game-cau-hinh-nang-gi.html">
                    <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/12/4/1583/1583_img1-68x68.jpg" alt="iPad 4 chơi được game cấu hình nặng gì"></div>
                    <div class="sn_name">iPad 4 chơi được game cấu hình nặng gì</div>
                    <div class="sn_date_added">02:34PM 04/12/2014</div>         </a>
                  </li>
                </ul></li>
                <li style="width: 218px; float: left; list-style: outside none none;" class="pager"><ul>
                  <li>
                    <a href="http://2tmobile.com/news/1594/apple-ngung-san-xuat-iphone-4s-va-iphone-5c-vao-2014.html">
                      <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/12/6/1594/1594_img1-68x68.jpg" alt="Apple ngừng sản xuất iPhone 4s và iPhone 5c vào 2014 "></div>
                      <div class="sn_name">Apple ngừng sản xuất iPhone 4s và iPhone 5c vào 2014 </div>
                      <div class="sn_date_added">03:49PM 06/12/2014</div>         </a>
                    </li>
                    <li>
                      <a href="http://2tmobile.com/news/1593/cach-tai-ayecon-cho-ios-7-tu-nguon-cydia.html">
                        <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/12/6/1593/1593_img1-68x68.jpg" alt="Cách tải Ayecon cho iOS 7 từ nguồn Cydia"></div>
                        <div class="sn_name">Cách tải Ayecon cho iOS 7 từ nguồn Cydia</div>
                        <div class="sn_date_added">03:22PM 06/12/2014</div>         </a>
                      </li>
                      <li>
                        <a href="http://2tmobile.com/news/1592/6-source-game-cydia-cho-iphone-khong-the-thieu.html">
                          <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/12/6/1592/1592_img1-68x68.jpg" alt="6 Source game Cydia cho iPhone không thể thiếu"></div>
                          <div class="sn_name">6 Source game Cydia cho iPhone không thể thiếu</div>
                          <div class="sn_date_added">03:20PM 06/12/2014</div>         </a>
                        </li>
                      </ul></li>
                      <li style="width: 218px; float: left; list-style: outside none none;" class="pager"><ul>
                        <li>
                          <a href="http://2tmobile.com/news/1591/dat-chu-ky-trong-tin-nhan-tren-iphone-ipad.html">
                            <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/12/6/1591/1591_img1-68x68.jpg" alt="Đặt chữ ký trong tin nhắn trên iPhone iPad"></div>
                            <div class="sn_name">Đặt chữ ký trong tin nhắn trên iPhone iPad</div>
                            <div class="sn_date_added">03:19PM 06/12/2014</div>         </a>
                          </li>
                          <li>
                            <a href="http://2tmobile.com/news/1590/oppo-r1c-mau-xanh-sapphire-cuc-ky-quyen-ru.html">
                              <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/12/5/1590/1590_img1-68x68.jpg" alt="Oppo R1C màu xanh sapphire cực kỳ quyến rũ"></div>
                              <div class="sn_name">Oppo R1C màu xanh sapphire cực kỳ quyến rũ</div>
                              <div class="sn_date_added">03:37PM 05/12/2014</div>         </a>
                            </li>
                            <li>
                              <a href="http://2tmobile.com/news/1589/cach-su-dung-chuc-nang-chup-anh-tren-ipad.html">
                                <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/12/5/1589/1589_img1-68x68.jpg" alt="Cách sử dụng chức năng chụp ảnh trên iPad"></div>
                                <div class="sn_name">Cách sử dụng chức năng chụp ảnh trên iPad</div>
                                <div class="sn_date_added">03:35PM 05/12/2014</div>         </a>
                              </li>
                            </ul></li>
                            <li style="width: 218px; float: left; list-style: outside none none;" class="pager"><ul>
                              <li>
                                <a href="http://2tmobile.com/news/1588/ipad-co-duoc-bao-hanh-toan-cau-nhu-iphone-khong.html">
                                  <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/12/5/1588/1588_img1-68x68.jpg" alt="iPad có được bảo hành toàn cầu như iPhone không"></div>
                                  <div class="sn_name">iPad có được bảo hành toàn cầu như iPhone không</div>
                                  <div class="sn_date_added">03:34PM 05/12/2014</div>         </a>
                                </li>
                                <li>
                                  <a href="http://2tmobile.com/news/1587/cam-nhan-game-hay-clash-of-clans-cho-ipad.html">
                                    <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/12/5/1587/1587_img1-68x68.jpg" alt="Cảm nhận game hay : Clash of Clans cho iPad"></div>
                                    <div class="sn_name">Cảm nhận game hay : Clash of Clans cho iPad</div>
                                    <div class="sn_date_added">03:33PM 05/12/2014</div>         </a>
                                  </li>
                                  <li>
                                    <a href="http://2tmobile.com/news/1586/cai-nhac-chuong-cho-iphone-6-khong-can-itunes.html">
                                      <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/12/5/1586/1586_img1-68x68.jpg" alt="Cài nhạc chuông cho iPhone 6 không cần iTunes"></div>
                                      <div class="sn_name">Cài nhạc chuông cho iPhone 6 không cần iTunes</div>
                                      <div class="sn_date_added">03:32PM 05/12/2014</div>         </a>
                                    </li>
                                  </ul></li>
                                  <li style="width: 218px; float: left; list-style: outside none none;" class="pager"><ul>
                                    <li>
                                      <a href="http://2tmobile.com/news/1585/cach-tai-game-tu-appstore-cho-iphone-6-6-plus.html">
                                        <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/12/4/1585/1585_img1-68x68.jpg" alt="Cách tải game từ Appstore cho iPhone 6 / 6 Plus"></div>
                                        <div class="sn_name">Cách tải game từ Appstore cho iPhone 6 / 6 Plus</div>
                                        <div class="sn_date_added">02:40PM 04/12/2014</div>         </a>
                                      </li>
                                      <li>
                                        <a href="http://2tmobile.com/news/1584/facetime-tren-ipad-co-mat-tien-de-su-dung-hay-khong.html">
                                          <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/12/4/1584/1584_img1-68x68.jpg" alt="Facetime trên iPad có mất tiền để sử dụng hay không"></div>
                                          <div class="sn_name">Facetime trên iPad có mất tiền để sử dụng hay không</div>
                                          <div class="sn_date_added">02:37PM 04/12/2014</div>         </a>
                                        </li>
                                        <li>
                                          <a href="http://2tmobile.com/news/1583/ipad-4-choi-duoc-game-cau-hinh-nang-gi.html">
                                            <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/12/4/1583/1583_img1-68x68.jpg" alt="iPad 4 chơi được game cấu hình nặng gì"></div>
                                            <div class="sn_name">iPad 4 chơi được game cấu hình nặng gì</div>
                                            <div class="sn_date_added">02:34PM 04/12/2014</div>         </a>
                                          </li>
                                        </ul></li>
                                      </ul></div><a class="bx-prev hide" href="">prev</a><a class="bx-next" href="">next</a></div>
                                    </div>
                                  </div>



                                  <script type="text/javascript">
                                    $(document).ready(function(){
                                      $('.sb_topnews').bxSlider({
                                        speed: 250,
                                        autoStart: false
                                      });
                                    });
                                  </script>
                                  <div class="box news">
                                    <div class="right"></div>
                                    <div class="top"><div><span>Tin xem</span> nhiều</div></div>
                                    <div class="middle sb_news">
                                      <div style="width:218px; position:relative;" class="bx-wrapper"><div style="position:relative; overflow:hidden; width:218px;" class="bx-window"><ul class="sb_topnews" style="width: 999999px; position: relative; left: -218px;"><li style="width: 218px; float: left; list-style: outside none none;"><ul>
                                        <li>
                                          <a href="http://2tmobile.com/news/1550/cac-ung-dung-cydia-hay-cho-ios-8-khong-nen-bo-qua.html">
                                            <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/11/27/1550/1550_img1-68x68.jpg" alt="Các ứng dụng Cydia hay cho iOS 8 không nên bỏ qua"></div>
                                            <div class="sn_name">Các ứng dụng Cydia hay cho iOS 8 không nên bỏ qua</div>
                                            <div class="sn_date_added">07:05AM 27/11/2014</div>         </a>
                                          </li>
                                          <li>
                                            <a href="http://2tmobile.com/news/1493/tai-quicklock-cho-ipad-4-tat-mo-man-hinh-khong-can-nut-nguon.html">
                                              <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/11/11/1493/1493_img1-68x68.jpg" alt="Tải Quicklock cho iPad 4 tắt mở màn hình không cần nút nguồn"></div>
                                              <div class="sn_name">Tải Quicklock cho iPad 4 tắt mở màn hình không cần nút nguồn</div>
                                              <div class="sn_date_added">03:45PM 11/11/2014</div>         </a>
                                            </li>
                                            <li>
                                              <a href="http://2tmobile.com/news/1514/cach-nap-tien-cho-ipad-dung-3g-mobi-vina-viettel.html">
                                                <div class="sn_image"><img src="http://2tmobile.com/image/cache/imgdata/nap-tien-ipad-68x68.jpg" alt="Cách nạp tiền cho iPad dùng 3G : Mobi, Vina, Viettel"></div>
                                                <div class="sn_name">Cách nạp tiền cho iPad dùng 3G : Mobi, Vina, Viettel</div>
                                                <div class="sn_date_added">10:32AM 15/11/2014</div>         </a>
                                              </li>
                                              <li>
                                                <a href="http://2tmobile.com/news/1513/cach-xem-thong-tin-cau-hinh-asus-zenfone-bang-phan-mem.html">
                                                  <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/11/15/1513/1513_img1-68x68.jpg" alt="Cách xem thông tin cấu hình Asus Zenfone bằng phần mềm"></div>
                                                  <div class="sn_name">Cách xem thông tin cấu hình Asus Zenfone bằng phần mềm</div>
                                                  <div class="sn_date_added">10:30AM 15/11/2014</div>         </a>
                                                </li>
                                                <li>
                                                  <a href="http://2tmobile.com/news/1511/cach-root-android-kitkat-4-4-cho-asus-zenfone-5-6.html">
                                                    <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/11/15/1511/1511_img1-68x68.png" alt="Cách Root android Kitkat 4.4 cho Asus Zenfone 5 6"></div>
                                                    <div class="sn_name">Cách Root android Kitkat 4.4 cho Asus Zenfone 5 6</div>
                                                    <div class="sn_date_added">10:25AM 15/11/2014</div>         </a>
                                                  </li>
                                                </ul></li>
                                                <li style="width: 218px; float: left; list-style: outside none none;" class="pager"><ul>
                                                  <li>
                                                    <a href="http://2tmobile.com/news/1485/iphone-5s-gold-cu-gia-bao-nhieu-thoi-diem-nay.html">
                                                      <div class="sn_image"><img src="http://2tmobile.com/image/cache/imgdata/1485_img2-68x68.jpg" alt="iPhone 5s gold cũ giá bao nhiêu thời điểm này"></div>
                                                      <div class="sn_name">iPhone 5s gold cũ giá bao nhiêu thời điểm này</div>
                                                      <div class="sn_date_added">03:01PM 08/11/2014</div>         </a>
                                                    </li>
                                                    <li>
                                                      <a href="http://2tmobile.com/news/1530/cam-nhan-iphone-4s-ios-8-1-1-muot-hon-ca-mong-doi.html">
                                                        <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/11/20/1530/1530_img1-68x68.jpg" alt="Cảm nhận iPhone 4s IOS 8.1.1 mượt hơn cả mong đợi"></div>
                                                        <div class="sn_name">Cảm nhận iPhone 4s IOS 8.1.1 mượt hơn cả mong đợi</div>
                                                        <div class="sn_date_added">03:03PM 20/11/2014</div>         </a>
                                                      </li>
                                                      <li>
                                                        <a href="http://2tmobile.com/news/1528/nen-mua-iphone-5s-hay-iphone-6-se-chinh-xac-nhat.html">
                                                          <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/11/20/1528/1528_img1-68x68.jpg" alt="Nên mua iPhone 5s hay iPhone 6 sẽ chính xác nhất"></div>
                                                          <div class="sn_name">Nên mua iPhone 5s hay iPhone 6 sẽ chính xác nhất</div>
                                                          <div class="sn_date_added">02:58PM 20/11/2014</div>         </a>
                                                        </li>
                                                        <li>
                                                          <a href="http://2tmobile.com/news/1512/cach-cai-nhac-chuong-bao-thuc-cho-asus-zenfone-4-5-6.html">
                                                            <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/11/15/1512/1512_img1-68x68.png" alt="Cách cài nhạc chuông báo thức cho Asus Zenfone 4 5 6"></div>
                                                            <div class="sn_name">Cách cài nhạc chuông báo thức cho Asus Zenfone 4 5 6</div>
                                                            <div class="sn_date_added">10:27AM 15/11/2014</div>         </a>
                                                          </li>
                                                          <li>
                                                            <a href="http://2tmobile.com/news/1515/nhung-nhuoc-diem-cua-ipad-air-ban-nen-can-nhac.html">
                                                              <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/11/15/1515/1515_img1-68x68.jpg" alt="Những nhược điểm của iPad Air bạn nên cân nhắc"></div>
                                                              <div class="sn_name">Những nhược điểm của iPad Air bạn nên cân nhắc</div>
                                                              <div class="sn_date_added">10:35AM 15/11/2014</div>         </a>
                                                            </li>
                                                          </ul></li>
                                                          <li style="width: 218px; float: left; list-style: outside none none;" class="pager"><ul>
                                                            <li>
                                                              <a href="http://2tmobile.com/news/1550/cac-ung-dung-cydia-hay-cho-ios-8-khong-nen-bo-qua.html">
                                                                <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/11/27/1550/1550_img1-68x68.jpg" alt="Các ứng dụng Cydia hay cho iOS 8 không nên bỏ qua"></div>
                                                                <div class="sn_name">Các ứng dụng Cydia hay cho iOS 8 không nên bỏ qua</div>
                                                                <div class="sn_date_added">07:05AM 27/11/2014</div>         </a>
                                                              </li>
                                                              <li>
                                                                <a href="http://2tmobile.com/news/1493/tai-quicklock-cho-ipad-4-tat-mo-man-hinh-khong-can-nut-nguon.html">
                                                                  <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/11/11/1493/1493_img1-68x68.jpg" alt="Tải Quicklock cho iPad 4 tắt mở màn hình không cần nút nguồn"></div>
                                                                  <div class="sn_name">Tải Quicklock cho iPad 4 tắt mở màn hình không cần nút nguồn</div>
                                                                  <div class="sn_date_added">03:45PM 11/11/2014</div>         </a>
                                                                </li>
                                                                <li>
                                                                  <a href="http://2tmobile.com/news/1514/cach-nap-tien-cho-ipad-dung-3g-mobi-vina-viettel.html">
                                                                    <div class="sn_image"><img src="http://2tmobile.com/image/cache/imgdata/nap-tien-ipad-68x68.jpg" alt="Cách nạp tiền cho iPad dùng 3G : Mobi, Vina, Viettel"></div>
                                                                    <div class="sn_name">Cách nạp tiền cho iPad dùng 3G : Mobi, Vina, Viettel</div>
                                                                    <div class="sn_date_added">10:32AM 15/11/2014</div>         </a>
                                                                  </li>
                                                                  <li>
                                                                    <a href="http://2tmobile.com/news/1513/cach-xem-thong-tin-cau-hinh-asus-zenfone-bang-phan-mem.html">
                                                                      <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/11/15/1513/1513_img1-68x68.jpg" alt="Cách xem thông tin cấu hình Asus Zenfone bằng phần mềm"></div>
                                                                      <div class="sn_name">Cách xem thông tin cấu hình Asus Zenfone bằng phần mềm</div>
                                                                      <div class="sn_date_added">10:30AM 15/11/2014</div>         </a>
                                                                    </li>
                                                                    <li>
                                                                      <a href="http://2tmobile.com/news/1511/cach-root-android-kitkat-4-4-cho-asus-zenfone-5-6.html">
                                                                        <div class="sn_image"><img src="http://2tmobile.com/image/cache/upload/news/2014/11/15/1511/1511_img1-68x68.png" alt="Cách Root android Kitkat 4.4 cho Asus Zenfone 5 6"></div>
                                                                        <div class="sn_name">Cách Root android Kitkat 4.4 cho Asus Zenfone 5 6</div>
                                                                        <div class="sn_date_added">10:25AM 15/11/2014</div>         </a>
                                                                      </li>
                                                                    </ul></li>
                                                                  </ul></div><a class="bx-prev hide" href="">prev</a><a class="bx-next" href="">next</a></div>
                                                                </div>
                                                              </div>



                                                              <div class="box">
                                                                <div class="right"></div>
                                                                <div class="top"><div><span>Hỗ trợ</span> trực tuyến</div></div>
                                                                <div style="overflow:hidden;" class="middle hotroonline">
                                                                  <div style="padding:5px;"><p><span style="font-size:22px"><strong>Giờ mở cửa</strong></span></p>

                                                                    <p><strong style="font-size:13px; line-height:1.6em"><span style="color:rgb(0, 0, 0); font-family:arial,helvetica,sans-serif; font-size:14px">&nbsp;- 09:00 - 20:00 (Thứ 2 - Thứ 7)</span></strong></p>

                                                                    <p><strong><span style="font-size:14px"><span style="color:rgb(0, 0, 0); font-family:arial,helvetica,sans-serif">&nbsp;- 09:00 - 17:00 (Chủ Nhật)</span></span></strong></p>
                                                                  </div>
                                                                  <div class="support">2Tmobile Trần Quang Khải</div>
                                                                  <table cellspacing="0" cellpadding="0" border="0" align="center" class="hotro">
                                                                    <tbody>
                                                                      <tr>
                                                                        <td align="left" width="12" class="tdtop">
                                                                          <a href="ymsgr:sendIM?ti_amo07"><img align="left" src="http://opi.yahoo.com/online?u=ti_amo07&amp;m=g&amp;t=0"></a>
                                                                        </td>
                                                                        <td align="center" class="tdtop">Tư vấn bán hàng</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td align="left" width="12" class="tdbottom">
                                                                          <a href="skype:duybphuc?chat"><img border="0" align="right" alt="Chat Skype" src="catalog/view/theme/default/image/skype.png"></a>
                                                                        </td>
                                                                        <td align="right" class="tdbottom">
                                                                          Hotline: <span>08.3526.8889</span>
                                                                        </td> 
                                                                      </tr>
                                                                    </tbody>
                                                                  </table>
                                                                  <div class="support">2Tmobile Lê Hồng Phong</div>
                                                                  <table cellspacing="0" cellpadding="0" border="0" align="center" class="hotro">
                                                                    <tbody>
                                                                      <tr>
                                                                        <td align="left" width="12" class="tdtop">
                                                                          <a href="ymsgr:sendIM?ti_amo07"><img align="left" src="http://opi.yahoo.com/online?u=ti_amo07&amp;m=g&amp;t=0"></a>
                                                                        </td>
                                                                        <td align="center" class="tdtop">Tư vấn bán hàng</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td align="left" width="12" class="tdbottom">
                                                                          <a href="skype:duybphuc?chat"><img border="0" align="right" alt="Chat Skype" src="catalog/view/theme/default/image/skype.png"></a>
                                                                        </td>
                                                                        <td align="right" class="tdbottom">
                                                                          Hotline: <span>08.6674.9554</span>
                                                                        </td> 
                                                                      </tr>
                                                                    </tbody>
                                                                  </table>
                                                                  <div class="support">Hợp tác kinh doanh</div>
                                                                  <table cellspacing="0" cellpadding="0" border="0" align="center" class="hotro">
                                                                    <tbody>
                                                                      <tr>
                                                                        <td align="left" width="12" class="tdtop">
                                                                          <a href="ymsgr:sendIM?ti_amo07"><img align="left" src="http://opi.yahoo.com/online?u=ti_amo07&amp;m=g&amp;t=0"></a>
                                                                        </td>
                                                                        <td align="center" class="tdtop">Hỗ trợ kinh doanh</td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td align="left" width="12" class="tdbottom">
                                                                          <a href="skype:duybphuc?chat"><img border="0" align="right" alt="Chat Skype" src="catalog/view/theme/default/image/skype.png"></a>
                                                                        </td>
                                                                        <td align="right" class="tdbottom">
                                                                          Hotline: <span>0938.871.216</span>
                                                                        </td> 
                                                                      </tr>
                                                                    </tbody>
                                                                  </table>
                                                                </div>
                                                              </div>
                                                              <div class="box">
                                                                <div class="right"></div>
                                                                <div class="top"><div><span>Hợp tác</span> kinh doanh</div></div>
                                                                <div class="middle lienketht">
                                                                  <p>
                                                                    <img width="278" src="http://2tmobile.com/image/data/khuyen mai/doitac1.jpg" rel="204" alt=""></p>
                                                                  </div>
                                                                </div>
                                                              </div>

                                                              <div id="content" style="width:73%;">
                                                                <div class="top">
                                                                  <div class="left" style="margin-left:1%"></div>
                                                                  <div class="right"></div>
                                                                  <div class="center" style="margin-right:76%;">
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

                                                               <div id="content" style="width:73%;">
                                                                <div class="top">
                                                                  <div class="left" style="margin-left:1%;"></div>
                                                                  <div class="right"></div>
                                                                  <div class="center" style="margin-right:76%;">
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
