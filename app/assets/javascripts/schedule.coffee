$(document).ready ->
  greyOutMembersOnLeave();

greyOutMembersOnLeave = ->
  $('.project.leave > .team-members > .member').each (i, member_not_in) ->
    name = $(member_not_in).data('user-name')
    $('*[data-user-name="' + name + '"]').addClass('leave')
