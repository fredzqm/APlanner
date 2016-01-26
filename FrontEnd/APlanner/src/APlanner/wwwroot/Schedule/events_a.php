<?php require('../header.php');?>
    <div id="content" class="container content_box">
        
    </div>
<script>
    $("#content").load( "details/"+'<?=$_GET["a"] ?>'+".html" , resizeFull );

    $(document).ready(main);
    function main(){
         $( window ).resize( resizeFull );
    }
    
    function resizeFull(){
        $("#content").find(".fullwidth").width($("#content").width());
    }
</script>
<?php require('../footer.php')?>