$(document).on('ready page:load', function () {
	$('.timestring').each(function() {
	  this.textContent = moment(this.textContent).format('lll');
	});
  // Actions to do
});
