<div id="slideshow<?php echo $module; ?>" class="slideshow" >
  <div class="sl_arrow_tl"></div>
  <div class="sl_arrow_tr"></div>
  <div class="sl_arrow_bl"></div>
  <div class="sl_arrow_br"></div>  
  
     <ul id="slider1">
      <?php foreach ($banners as $banner) {?>
      <li class="pager">
        <a href="<?php echo $banner['link']; ?>">
          <img src="<?php echo $banner['image']; ?>" />
        </a>
      </li>
      <?php } ?>
    </ul>

    <?php $count = 0 ?>
    <?php foreach($banners as $banner) { $count = $count + 1;?>
    <?php if ($count == 1) {?>

    <a href="<?php echo $banner['link']; ?>" class="paper-top pager-link pager-<?php echo $count?>;">
      <span class="paper-left"></span>
      <span class="paper-name"><?php echo $banner['title'];?></span>
      <span class="pager-desc"></span>
    </a>
    <?php } else { ?>
    <a href="<?php echo $banner['link']; ?>" class="pager-link pager-<?php echo $count?>;">
      <span class="paper-left"></span>
      <span class="paper-name"><?php echo $banner['title'];?></span>
      <span class="pager-desc"></span>
    </a>
    <?php } ?>
    <?php } ?>

</div>
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
