

$(document).ready(function() {
  $('#sort_menu').toggle(
    function(){
      $('#main_menu').sortable({
        containment: 'parent',
        axis: 'x',
        update: postSortData
      });
    },
    function(){
      $('#menu').sortable('destroy');
    }
  );
});


