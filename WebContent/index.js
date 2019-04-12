
//Sticky navbar
window.onload = window.onscroll = function() {stickybar();};			
function stickybar() 
{
  var mainbar = document.getElementById("mainbar");
  var navbar = document.getElementById("navbar");
  var sticky = navbar.offsetTop; 	
  if (window.pageYOffset >= sticky) 
  {
	mainbar.classList.add("fixhead");
	navbar.classList.add("sticky");
  } 
  else 
  {
	mainbar.classList.remove("fixhead");
	navbar.classList.remove("sticky");
  }
}

//Sticky sidebar
jQuery( document ).ready(function( $ ){
	var sidebar = $('.sidebar').offset().top;
	$(window).scroll(function(){
		var y_scroll_pos = window.pageYOffset;
		var scroll_pos_test = sidebar;

	   if (y_scroll_pos >= scroll_pos_test-60)
	   {
			$('.sidebar').addClass('lock-sidebar');
	   }
	   else
	   {
			$('.sidebar').removeClass('lock-sidebar');
	   }
	});
});


								