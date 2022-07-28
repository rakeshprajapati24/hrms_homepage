
// document ready function
$(document).ready(function(){

	$('.clients-slider').slick({
	  infinite: true,
	  dots: true,
	  arrows: false,
	  responsive: [
	    {
	      breakpoint: 2400,
	      settings: {
	        slidesToShow: 5,
	        slidesToScroll: 5,
	      }
	    },
	    {
	      breakpoint: 1279,
	      settings: {
	        slidesToShow: 4,
	        slidesToScroll: 4
	      }
	    },
	    {
	      breakpoint: 767,
	      settings: {
	        slidesToShow: 3,
	        slidesToScroll: 3
	      }
	    },
	    {
	      breakpoint: 479,
	      settings: {
	        slidesToShow: 2,
	        slidesToScroll: 2
	      }
	    }
	  ]
	});
	 
	$(".menu-btn").click(function(){
		$(".right-boxes").addClass("active")
	})

	$(".close-menu").click(function(){
		$(".right-boxes").removeClass("active")
	})
 	AOS.init({
 		once: true,
 	});
 	 
  function add_fields(link, association, content, partials) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g");
    $(link).parent().before(content.replace(regexp, new_id));
  }

  function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
  }

})



