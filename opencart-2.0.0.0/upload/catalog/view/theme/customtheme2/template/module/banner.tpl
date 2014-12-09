<div id="carousel<?php echo $module; ?>" class="slidebottom">

 <div class="slide1">
 
    
      <ul id="slide1">
       <?php $count = -1; ?>
       <?php foreach($banners as $banner) {  $count = $count + 1;  ?>
       <?php if ($count <2) { ?>
       <li><a href="<?php echo $banner['link'];?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" ></a></li>
       <?php } ?>
       <?php } ?>
     </ul>
 

</div>
<div class="slide2">
 
      <ul id="slide2">
        <?php $count = -1; ?>
        <?php foreach($banners as $banner) {  $count = $count + 1;  ?>
        <?php  if ($count >= 2 && $count < 4) { ?>
        <li><a href="<?php echo $banner['link'];?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" ></a></li>
        <?php } ?>
        <?php } ?>
      </ul>
  
</div>
<div class="slide3">
  
      <ul id="slide3">
       <?php $count = -1; ?>
       <?php foreach($banners as $banner) {  $count = $count + 1;  ?>
       <?php  if ($count >=4) {  ?>
       <li><a href="<?php echo $banner['link'];?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" ></a></li>
       <?php }?>
       <?php }?>
     </ul>
  
</div>


</div>
<script type="text/javascript">
  $(document).ready(function(){
    $('#slide1').bxSlider({
      speed: 1000,
      pause: 4000,
      mode: 'fade',
      controls: false,
      autoStart: true
    });
    $('#slide2').bxSlider({
      speed: 1000,
      pause: 4000,
      mode: 'fade',
      controls: false,
      autoStart: true
    });
     $('#slide3').bxSlider({
      speed: 1000,
      pause: 4000,
      mode: 'fade',
      controls: false,
      autoStart: true
    });
  });
</script>
