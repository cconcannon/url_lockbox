$(document).ready(function() {
  var $links = $('.link_details');

  $('#link_search').on("keyup", function(){
    var $input = this.value;

    $links.each(function(index, link){
      if ($(link).data("title").toLowerCase().indexOf($input) !== -1 ){
        $(link).show();
      } else {
        $(link).hide();
      }
    });
  });
});
