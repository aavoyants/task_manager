// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
// require_tree .
//= require jquery-ui-1.9.2.custom
//
MainCSS = {
  perform: function() {
    $('input:submit').button();
    $('input:text').button().css({
      'background-image' : 'none',
      'background-color' : '#ffffff',
      'color' : 'inherit',
      'text-align' : 'left',
      'outline' : 'none',
      'cursor' : 'text'
    });

    // Hover states on the static widgets
    $(".icons li").hover(
      function() {
        $(this).addClass( "ui-state-hover" );
      },
      function() {
        $(this).removeClass( "ui-state-hover" );
      }
    );

    $.datepicker.formatDate('yyyy-mm-dd');
  }
};
$(MainCSS.perform);
