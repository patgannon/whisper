

$(document).ready(function() {
  $('#sort_menu').toggle(
    function(){
      $('#main_menu').sortable({
        containment: 'parent',
        axis: 'x',
        update: function(event, ui){
          $.post(
            SORT_ACTION, $('#main_menu').sortable('serialize')
          );
        }
      });
    },
    function(){
      $('#menu').sortable('destroy');
    }
  );
});



