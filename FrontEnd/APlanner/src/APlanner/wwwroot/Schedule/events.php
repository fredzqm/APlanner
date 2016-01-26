<?php
$TIME_ZONE =  -4 ;//Indiana Time
$DEFAULT_DURATION = 1;
$out = array();
$file=file_get_contents("events.txt");
$events=explode("$\n",$file);
$out = array();

$colorToClass = ['red'=>'event-important','green'=>'event-success','yellow'=>'event-warning','blue'=>'event-info','black'=>'event-inverse' ,'purple'=>'event-special'];

$files = scandir('details/');


//convert the array of events to specified array format
for($i = 1 ; $i < count($events) ; $i++){
    $e = $events[$i];
    $d = explode("\n",$e);
    if(count($d)>=4){
        $start = strtotime($d[2]);
        if(count($d)>=5){
            $end = strtotime($d[3]);
        }else{
            $end = $start + 3600;
        }
        $start -= 3600*$TIME_ZONE; //convert time zone
        $end -= 3600*$TIME_ZONE;
        $Formal_name = str_replace(" ", "_", $d[0]);
        
        if(in_array($Formal_name.'.html' , $files)){
            $url = "events_a.php?a=".$Formal_name;
        }else{
            $url = '#';
        }
        $out[] = array(
            'length' => count($d),
            'id' => $i,
            'title' => $d[0],
            'url' => $url,
            'class' => $colorToClass[$d[1]],
            'start' => "".$start."000",
            'end' =>  "".$end."000"
        );
    }
    
}

echo json_encode(array('success' => 1, 'result' => $out));
?>