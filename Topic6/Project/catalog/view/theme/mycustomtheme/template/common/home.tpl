<?php echo $header; ?>
<?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="wrapper">
    <?php echo $content_top; ?>
    <?php echo $column_right; ?>
    <?php echo $content_bottom; ?>
    </div>
    
</div> <!-- end div container in header.tpl file -->
<?php echo $footer; ?>