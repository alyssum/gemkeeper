$(document).ready(function() {

  $('.remove-role').click( function(e) {
    $(e.target).prev('input[type=hidden]').val('true');
    $(e.target).parents('.role-field').hide();
  });

  $('#add-role').click( function() {
    var newNum  = new Date().getTime(); // use time to make sure new id is unique

    // Cloning won't work if the user removes all input boxes!
    var newElem = $('.role-fields').children('.role-field').last().clone(); //.attr('id', 'game_roles_attributes_' + newNum + '_name');

    //$('.role-fields').children('.role-field').last().after(newElem);
  });

});
