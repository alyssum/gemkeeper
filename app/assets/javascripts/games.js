$(document).ready(function() {
  // TODO: If form validation fails, the URL changes to /game/<id> (not /game/<id>/edit) and remove buttons do not work.

  $('.remove-role').click( function(e) {
    // Set the hidden field for RoR _destroy attribute
    $(e.target).prev('input[type=hidden]').val('true');

    // Delete the field (TODO: User can delete all fields and have no way to input new roles)
    $(e.target).parents('.role-field').remove();
  });

  $('.add-role').click( function() {
    // Use first element of role fields to clone
    var template = $('.role-field').first().clone();

    // Assign a new unique id (TODO: This is very fragile as 0's might be elsewhere for good reason)
    var id = $('.role-field').length; 
    var html = template.html().replace(new RegExp('0', 'g'), id);
    template.html(html)

    // Clear out default value from cloned item
    template.find('input:text').val('');

    // Insert at bottom of role field list
    $('.role-fields').children('.role-field').last().after(template);

    // New cloned remove button needs a click action defined
    $('.remove-role').on('click', function(e) {
      $(e.target).parents('.role-field').hide();
    });
  });

});
