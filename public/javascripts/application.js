jQuery(document).ready(function($) {
  $('a[rel*=facebox]').facebox({
		opacity			 : 0.5
	}) 
});

function count(maxLength) {

	var lngCount = $("#post_text").val().length;
	
	currentLength = maxLength - lngCount;
	
	if (lngCount > maxLength) {
		$("#count").html("<span style='color:red;'>" + currentLength + "</span>");
		$('#post_submit').attr('disabled', 'disabled');
	} else {
		$("#count").html(currentLength);
		$('#post_submit').removeAttr('disabled');
	}
	
}