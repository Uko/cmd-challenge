PrivatePub.subscribe "/users/" + user_id, (data, channel) ->
  $("#shared-tasks").append "<div class='task'>" + "<h3>" + data.title + "</h3>" + "<p>" + data.description + "</p>" + "<p> Owner: <span class='label'>" + data.owner + "</span> </p>" + "</div> <hr/>"
