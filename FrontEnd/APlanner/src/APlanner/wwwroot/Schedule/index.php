<?php require('../header.php')?>
<div class="container content_box">
        <div class="page-header">
            <h3 class="col-sm-4 col-md-5 col-lg-6"></h3>
            <div class="">
                <div class="btn-group">
                    <button class="btn btn-primary" data-calendar-nav="prev"><< Prev</button>
                    <button class="btn" data-calendar-nav="today">Today</button>
                    <button class="btn btn-primary" data-calendar-nav="next">Next >></button>
                </div>
                <div class="btn-group">
                    <button class="btn btn-warning" data-calendar-view="year">Year</button>
                    <button class="btn btn-warning active" data-calendar-view="month">Month</button>
                    <button class="btn btn-warning" data-calendar-view="week">Week</button>
                    <button class="btn btn-warning" data-calendar-view="day">Day</button>
                </div>
            </div>
        </div>
        <br>
        <div class="col-md-9"><div id="calendar"></div></div>
        <div class="col-md-3"><div id="eventlist" class="nav nav-list"></div></div>
</div>

<script src="lib/underscore-min.js"></script>
<script src="lib/calendar.min.js"></script>

<?php require('../footer.php')?>