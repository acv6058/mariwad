// Activates the Carousel
$('.carousel').carousel({
  interval: 5000
});

// Activates Tooltips for Social Links
$('.tooltip-social').tooltip({
  selector: "a[data-toggle=tooltip]"
});

$(window).load(function(){
 var menu_sidebar = $('#menu-sidebar');
 if (menu_sidebar.length > 0) {
  sidebar_nav_width = $('#page-sidebar').width();
  $('#fb-sidebar-widget').attr('data-width', sidebar_nav_width);
 }
})