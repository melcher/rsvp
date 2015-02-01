// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .


$(function(){
  'use_strict';
  $('.hidden').hide().removeClass('hidden');
  $('.response_food_restrictions').hide();
  $(document).on('change', '.response_responded_with', function(event){
    var value = $(event.target).val();
    if(/attend|accept/.test(value)){
      $('.attending-wrapper').slideDown();
    }else{
      $('.attending-wrapper').slideUp();
    }
  });
  $(document).on('change', '.food_restrictions_toggle :input', function(event){
    if($(event.target).val() == 'true'){
      $('.response_food_restrictions').fadeIn();
    }else{
      $('.response_food_restrictions').fadeOut();
    }
  });
});
