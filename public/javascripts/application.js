jQuery(document).ready(function($) {
  $('a[rel*=facebox]').facebox({
		opacity			 : 0.5,
		loadImage 	 : '/images/loading.gif',
		closeImage   : '/images/closelabel.gif'
	}) 
})