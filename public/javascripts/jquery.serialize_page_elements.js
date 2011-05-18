$(document).ready(function() {

  (function( $ ){
    var serious_methods = {
      text_area: function($el) {
        console.log('ele:');
        console.log($el);
        return {html: $el.find('.contents').html()};
      },
      page_element: function($el) {
        return {};
      }
    };
    
    $.fn.serialize_page_elements = function() {
      return $.map(this.children(), 
        function(elementOfArray, indexInArray) { 
          console.log(elementOfArray);
          $el = $(elementOfArray);
          console.log($el.attr('id'));
          idInfo = /^(.*)_([^_]+)$/.exec($el.attr('id'));
          console.log(idInfo);
          elementType = idInfo[1]
          
          return {
            type: elementType,
            id:   idInfo[2],
            data: serious_methods[elementType]($el)
          };
        }    
      );
    };
  })( jQuery );
});

