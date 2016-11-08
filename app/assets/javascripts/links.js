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

  $('#link_sort').click(function() {
    $(this).toggleClass("hidden");
    $('#link_unsort').toggleClass("hidden");
    var table = $('table');
    var rows = $links.get();
    sorted = rows.sort(function(a, b) {
      if ($(a).data("title") > $(b).data("title")) {
        return 1;
      } else {
        return -1;
      }
    });
    $.each(sorted, function(index, row) {
      table.children('tbody').append(row);
    });
  });

  $('#link_unsort').click(function() {
    $(this).toggleClass("hidden");
    $('#link_sort').toggleClass("hidden");
    var table = $('table');
    var rows = $links.get();
    $.each(rows, function(index, row) {
      table.children('tbody').append(row);
    });
  });
});
