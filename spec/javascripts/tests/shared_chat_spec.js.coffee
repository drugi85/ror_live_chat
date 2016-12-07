describe "ChatPage", () ->

  describe "constructor" ,() ->
    it "finds elem id" , ->
      id="textarea"
      id2 = "chat_error"
      spyOn(window.$.fn, "val").andReturn("")
      spyOn(window, "$").andCallThrough()
      chat_obj = new ChatPage(id, id2)    
      expect(window.$).toHaveBeenCalledWith("#"+id) 

    it "sets the value" , ->
      spyOn(window.$.fn, 'val').andReturn("test")
      id = "id"
      message = "some error message"
      chat_obj = new ChatPage(id, message)
      expect(window.$.fn.val).toHaveBeenCalled()
      
  describe "is valid ", () ->
    valids = null
    id = null
    message = null
    beforeEach ->
      spyOn(window.$.fn, 'val').andReturn("test")
      spyOn(window, "$").andCallThrough()
      id = "id"
      message = "some error message"  
      valids = new window.ChatPage(id, message)
     
    it "checks is valid", ->
      spyOn(valids,"hide_error")
      spyOn(valids,"is_required").andReturn(true)
      valids.is_valid()
      expect(valids.is_required).toHaveBeenCalledWith(valids.message_value)
      expect(valids.hide_error).toHaveBeenCalledWith(message)
      expect(true).toEqual(valids.is_valid())

    it "shows error when not required ", ->
      spyOn(valids,"show_error")
      spyOn(valids,"is_required").andReturn(false)
      valids.is_valid()
      expect(valids.show_error).toHaveBeenCalledWith(message, "Text is required")
      expect(false).toEqual(valids.is_valid())
 
  describe "is invalid with longer text ", () ->
    
    it "shows error", ->
      spyOn(window.$.fn, 'val').andReturn("12345678901234")
      spyOn(window, "$").andCallThrough()
      id = "id"
      message = "some error message"
      valids = new window.ChatPage(id, message)
      spyOn(valids,"show_error")
      spyOn(valids,"is_required").andReturn(true)
      valids.is_valid()
      expect(valids.show_error).toHaveBeenCalledWith(message, "Text is longer than 10 characters")
      expect(false).toEqual(valids.is_valid()) 
  describe "add message",->
    it "add message chat" ,->
      id_list = "id_list"
      id_message = "message"
      id_color = "color"
      spyOn(window, "$").andCallThrough()
      window.add_message_chat(id_list, id_message, id_color)    
      expect(window.$).toHaveBeenCalledWith("#"+id_list) 
  
    it "validations html" ,->  
      spyOn(window, "$").andCallThrough()
      id_list = "id_list"
      id_message = "message"
      id_color = "color"
      window.add_message_chat(id_list, id_message, id_color) 
      expect(window.$).toHaveBeenCalledWith('<li></li>');
      

    it "validations html" ,->  
      fake = {
        css: ->
        appendTo: ->  
      }
      spyOn(window.$.fn, "html").andReturn(fake)
      spyOn(fake, "css").andReturn(fake)
      spyOn(fake, "appendTo").andReturn(fake)
      id_list = "id_list"
      id_message = "message"
      id_color = "color"
      result = window.add_message_chat(id_list, id_message, id_color) 
      expect(window.$.fn.html).toHaveBeenCalledWith(id_message);
      expect(fake.css).toHaveBeenCalledWith({color: id_color});
      expect(fake.appendTo).toHaveBeenCalledWith($("#"+id_list));
      expect(true).toEqual(result);
