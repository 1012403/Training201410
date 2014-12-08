<div id="content">
  <div class="top">
    <div class="left"></div>
    <div class="right"></div>
    <div class="center">
      <h2 class="h2top">Sản phẩm khuyến mãi</h2>
    </div>
  </div>
  <div class="middle product">
    <ul class="list">
      <?php foreach ($products as $product) { ?>
      <?php foreach ($product['attribute_groups'] as $attribute_group) { ?>  
      <?php foreach($attribute_group['attribute'] as $attribute) { ?>
      <?php if($attribute['name'] == "strategy" && $attribute['text'] == "Sản phẩm khuyến mãi") { ?>
      <li>
        <span class="icon_label lbid2" style="background:#0066FF;color:#FFF">GIFT</span>            
        <div class="list_desc">
          <div class="list_image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"></a></div>
          <h3 class="list_name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
          <div class="list_opt">
            (16GB / 64GB / 128GB)
          </div>
          <div class="list_price">
            <span class="price"><span class="textp">Giá từ </span><?php echo $product['price']; ?>đ</span>
          </div>
          <div class="list_tprom">Khuyến mãi trị giá đến <b>2.350.000đ</b></div>      
        </div>
        
        <div class="list_bdesc">
          <a class="lbdesc_href" href="<?php echo $product['href']; ?>">   
            <?php foreach ($product['attribute_groups'] as $attribute_group) { ?>          
            <?php foreach($attribute_group['attribute'] as $attr) { ?>
            <?php if($attr['name'] != "strategy") { ?>
              <p><?php echo $attr['name']; echo " : ".$attr['text'] ?></p>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </a>
        </div>
      </li>
      <?php break;} ?>
      <?php } ?>
      <?php } ?>
      <?php } ?>
    </ul>
  </div>
</div>
<!-- sản phẩm sắp ra mắt -->
<div id="content">
  <div class="top">
    <div class="left"></div>
    <div class="right"></div>
    <div class="center">
      <h2 class="h2top">Sản phẩm sắp ra mắt</h2>
    </div>
  </div>
  <div class="middle product">
    <ul class="list">
      <?php foreach ($products as $product) { ?>
      <?php foreach ($product['attribute_groups'] as $attribute_group) { ?>  
      <?php foreach($attribute_group['attribute'] as $attribute) { ?>
      <?php if($attribute['name'] == "strategy" && $attribute['text'] == "Sản phẩm sắp ra mắt") { ?>
      <li>
        <span class="icon_label lbid2" style="background:#0066FF;color:#FFF">GIFT</span>            
        <div class="list_desc">
          <div class="list_image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"></a></div>
          <h3 class="list_name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
          <div class="list_opt">
            (16GB / 64GB / 128GB)
          </div>
          <div class="list_price">
            <span class="price"><span class="textp">Giá từ </span><?php echo $product['price']; ?>đ</span>
          </div>
          <div class="list_tprom">Khuyến mãi trị giá đến <b>2.350.000đ</b></div>      
        </div>
        
        <div class="list_bdesc">
          <a class="lbdesc_href" href="<?php echo $product['href']; ?>">   
            <?php foreach ($product['attribute_groups'] as $attribute_group) { ?>          
            <?php foreach($attribute_group['attribute'] as $attr) { ?>
            <?php if($attr['name'] != "strategy") { ?>
              <p><?php echo $attr['name']; echo " : ".$attr['text'] ?></p>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </a>
        </div>
      </li>
      <?php break;} ?>
      <?php } ?>
      <?php } ?>
      <?php } ?>
    </ul>
  </div>
</div>
<!--Điện thoại iPhone -->
<div id="content">
  <div class="top">
    <div class="left"></div>
    <div class="right"></div>
    <div class="center">
      <h2 class="h2top">Điện thoại iPhone</h2>
    </div>
  </div>
  <div class="middle product">
    <ul class="list">
      <?php foreach ($products as $product) { ?>
      <?php foreach ($product['attribute_groups'] as $attribute_group) { ?>  
      <?php foreach($attribute_group['attribute'] as $attribute) { ?>
      <?php if($attribute['name'] == "strategy" && $attribute['text'] == "Điện thoại iPhone") { ?>
      <li>
        <span class="icon_label lbid2" style="background:#0066FF;color:#FFF">GIFT</span>            
        <div class="list_desc">
          <div class="list_image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"></a></div>
          <h3 class="list_name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
          <div class="list_opt">
            (16GB / 64GB / 128GB)
          </div>
          <div class="list_price">
            <span class="price"><span class="textp">Giá từ </span><?php echo $product['price']; ?>đ</span>
          </div>
          <div class="list_tprom">Khuyến mãi trị giá đến <b>2.350.000đ</b></div>      
        </div>
        
        <div class="list_bdesc">
          <a class="lbdesc_href" href="<?php echo $product['href']; ?>">   
            <?php foreach ($product['attribute_groups'] as $attribute_group) { ?>          
            <?php foreach($attribute_group['attribute'] as $attr) { ?>
            <?php if($attr['name'] != "strategy") { ?>
              <p><?php echo $attr['name']; echo " : ".$attr['text'] ?></p>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </a>
        </div>
      </li>
      <?php break;} ?>
      <?php } ?>
      <?php } ?>
      <?php } ?>
    </ul>
  </div>
</div>
<!--Smartphone cao cấp được ưa chuộng -->
<div id="content">
  <div class="top">
    <div class="left"></div>
    <div class="right"></div>
    <div class="center">
      <h2 class="h2top">Smartphone cao cấp được ưa chuộng</h2>
    </div>
  </div>
  <div class="middle product">
    <ul class="list">
      <?php foreach ($products as $product) { ?>
      <?php foreach ($product['attribute_groups'] as $attribute_group) { ?>  
      <?php foreach($attribute_group['attribute'] as $attribute) { ?>
      <?php if($attribute['name'] == "strategy" && $attribute['text'] == "Smartphone cao cấp được ưa chuộng") { ?>
      <li>
        <span class="icon_label lbid2" style="background:#0066FF;color:#FFF">GIFT</span>            
        <div class="list_desc">
          <div class="list_image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"></a></div>
          <h3 class="list_name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
          <div class="list_opt">
            (16GB / 64GB / 128GB)
          </div>
          <div class="list_price">
            <span class="price"><span class="textp">Giá từ </span><?php echo $product['price']; ?>đ</span>
          </div>
          <div class="list_tprom">Khuyến mãi trị giá đến <b>2.350.000đ</b></div>      
        </div>
        
        <div class="list_bdesc">
          <a class="lbdesc_href" href="<?php echo $product['href']; ?>">   
            <?php foreach ($product['attribute_groups'] as $attribute_group) { ?>          
            <?php foreach($attribute_group['attribute'] as $attr) { ?>
            <?php if($attr['name'] != "strategy") { ?>
              <p><?php echo $attr['name']; echo " : ".$attr['text'] ?></p>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </a>
        </div>
      </li>
      <?php break;} ?>
      <?php } ?>
      <?php } ?>
      <?php } ?>
    </ul>
  </div>
</div>
<!-- Máy tính bảng -->
<div id="content">
  <div class="top">
    <div class="left"></div>
    <div class="right"></div>
    <div class="center">
      <h2 class="h2top">Máy tính bảng</h2>
    </div>
  </div>
  <div class="middle product">
    <ul class="list">
      <?php foreach ($products as $product) { ?>
      <?php foreach ($product['attribute_groups'] as $attribute_group) { ?>  
      <?php foreach($attribute_group['attribute'] as $attribute) { ?>
      <?php if($attribute['name'] == "strategy" && $attribute['text'] == "Máy tính bảng") { ?>
      <li>
        <span class="icon_label lbid2" style="background:#0066FF;color:#FFF">GIFT</span>            
        <div class="list_desc">
          <div class="list_image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"></a></div>
          <h3 class="list_name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
          <div class="list_opt">
            (16GB / 64GB / 128GB)
          </div>
          <div class="list_price">
            <span class="price"><span class="textp">Giá từ </span><?php echo $product['price']; ?>đ</span>
          </div>
          <div class="list_tprom">Khuyến mãi trị giá đến <b>2.350.000đ</b></div>      
        </div>
        
        <div class="list_bdesc">
          <a class="lbdesc_href" href="<?php echo $product['href']; ?>">   
            <?php foreach ($product['attribute_groups'] as $attribute_group) { ?>          
            <?php foreach($attribute_group['attribute'] as $attr) { ?>
            <?php if($attr['name'] != "strategy") { ?>
              <p><?php echo $attr['name']; echo " : ".$attr['text'] ?></p>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </a>
        </div>
      </li>
      <?php break;} ?>
      <?php } ?>
      <?php } ?>
      <?php } ?>
    </ul>
  </div>
</div>
<!--
<h3><?php echo $heading_title; ?></h3>
<div class="row product-layout">
  <?php foreach ($products as $product) { ?>
  <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <div class="product-thumb transition">
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      <div class="caption">
        <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
        <p><?php echo $product['description']; ?></p>
        <?php if ($product['rating']) { ?>
        <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['price']) { ?>
        <p class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
          <?php if ($product['tax']) { ?>
          <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
          <?php } ?>
        </p>
        <?php } ?>
      </div>
      <div class="button-group">
        <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
      </div>
    </div>
  </div>
  <?php } ?>
</div>
-->