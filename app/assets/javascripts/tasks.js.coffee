PrivatePub.subscribe "/users/" + user_id, (data, channel) ->
  $("#shared-tasks").prepend  "<div class = 'task', style = 'display: none'>" +
                                "<h3>" + data.title + "<span class='badge badge-important'>new</span> </h3>" +
                                "<p>" + data.description + "</p>" +
                                "<p> Owner: <span class='label'>" + data.owner + "</span> </p>" +
                                "<hr/>" +
                              "</div>"
  $("#shared-tasks .task:first-child").show("slow")
  
jQuery ->
  $(".share-task-autocomplete").typeahead
    source: (query, process) ->
      $.get "get-users",
        'str-to-complete': query
        'amount': 8, 
        (data) ->
          process data
    items: 8
    minLength: 3