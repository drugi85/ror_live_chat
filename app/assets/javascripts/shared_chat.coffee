//= require "./validations"

class window.ChatPage extends window.Validations

  constructor: (@message_elem_id, @message_error_id) ->
    @.message_elem = $('#' + message_elem_id);
    @.message_value = @.message_elem.val().trim();

  is_valid: ->
    if (@.is_required(@.message_value) && @.message_value.length <= 10)
      @.hide_error(@message_error_id)
      return true
    else
      if @.is_required(@.message_value) == false 
        error = "Text is required";
        @.show_error(@message_error_id, error)
      else
       if (@.message_value.length > 10)
        error = "Text is longer than 10 characters";
        @.show_error(@message_error_id, error)
      return false  


window.add_message_chat = (id_list, message, color) ->
   ul = $("#" + id_list)
   li = $("<li></li>").html(message)
   li.css(color: color)
   li.appendTo(ul)
   return true

