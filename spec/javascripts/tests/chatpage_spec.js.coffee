describe "Chatpage", () ->
  
  describe "on click", ->
     it "should invoke the button click event.", ->
       loadFixtures('chatpage.html')
       spyEvent = spyOnEvent('#sendchatpage', 'click')
       $('#sendchatpage').click();
       expect('click').toHaveBeenTriggeredOn('#sendchatpage')
       expect(spyEvent).toHaveBeenTriggered()
   
   describe "sendchatpage", () ->
     chatpage = {}
     beforeEach ->
       spyOn(window.$.fn, "val").andReturn("test")
      
     describe "valid", () -> 
       my_event = null
       beforeEach ->
         my_event= {preventDefault: -> }
         spyOn(my_event, "preventDefault")
         spyOn(ChatPage.prototype, "is_valid").andReturn(true)
     
       it "checks if valid", ->
         window.sendchatpage(my_event)
         expect(my_event.preventDefault).toHaveBeenCalled()
         expect(ChatPage.prototype.is_valid).toHaveBeenCalled()
        
       it "checks ajax", ->
         spyOn(window.$, "ajax").andCallFake( 
            (options) => 
              options.success = "success"
              options.error = "error"  
         )  
         window.sendchatpage(my_event)  
         expect(window.$.ajax).toHaveBeenCalledWith({ 
            url : '/add-message', 
            data : { 
             user_id : 'test', 
             message : 'test' 
            }, 
            dataType : 'json', 
            type : 'post', 
            success: "success"
            error: "error"
         })          
         
       it "verifies sucess callback ajax", ->
         spyOn(window.$, "ajax").andCallFake(
            (options) =>
              options.success()
         )
         spyOn(window , "add_message_chat")
         window.sendchatpage(my_event)
         expect(window.add_message_chat).toHaveBeenCalledWith('chat_list', 'test', 'red')

       it "verifies error callback ajax", ->
         message = "custom message"
         json_errors = {errors: message}
         errors = '{"errors": "'+message+'"}'
         spyOn(window.$, "ajax").andCallFake(
            (options) =>
              xhr = {responseText: errors }
              options.error(xhr)
         )
         spyOn(window.JSON, "parse").andReturn(json_errors)
         spyOn(ChatPage.prototype , "show_error")
         window.sendchatpage(my_event)
         expect(window.JSON.parse).toHaveBeenCalledWith(errors)
         expect(ChatPage.prototype.show_error).toHaveBeenCalledWith('chat_error', message)    
  