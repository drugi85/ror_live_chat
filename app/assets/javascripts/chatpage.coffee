//= require "./shared_chat"

$ ->
  $('#sendchatpage').click(
   (e) ->
     window.sendchatpage(e)	    	
  )

window.sendchatpage = (e) ->
  chat_page = new ChatPage('textarea', "chat_error");
  if chat_page.is_valid()
    e.preventDefault()
    user_id = $("#chat_user_id").val()
    message = $("#textarea").val().trim()
    $.ajax(
      url:"/add-message"
      data: {user_id: user_id, message: message}
      dataType:"json"
      type:"post"
      success: (response) ->
         add_message_chat('chat_list',chat_page.message_value,"red")
      error: (xhr, status, response) ->
         error_list = JSON.parse(xhr.responseText)
         chat_page.show_error('chat_error', error_list.errors)
     )    
  return true        