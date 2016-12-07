describe "Userpass", ->
    
  it "should invoke the button click event.", ->
    loadFixtures('home_page.html')
    spyEvent = spyOnEvent('#button', 'click')
    $('#button').click();
       
    expect('click').toHaveBeenTriggeredOn('#button')
    expect(spyEvent).toHaveBeenTriggered()

  describe "window.button_click", ->
    
    beforeEach ->
     spyOn(window.$.fn, 'val').andReturn("test")
     spyOn(window, '$').andCallThrough()
     spyOn(window.Validations.prototype, 'hide_error')
     spyOn(window.Validations.prototype, 'show_error')
     
    it "finds the elements", ->
     window.button_click()
     expect(window.$).toHaveBeenCalledWith("#user_username")
     expect(window.$).toHaveBeenCalledWith("#user_email") 
    
    it "hides the errors when correct", ->
     spyOn(window.Validations.prototype, 'is_required').andReturn(true)
     spyOn(window.Validations.prototype, 'is_valid_email').andReturn(true)
     window.button_click()
     expect(window.Validations.prototype.is_required).toHaveBeenCalledWith("test");
     expect(window.Validations.prototype.is_valid_email).toHaveBeenCalledWith("test")
     expect(window.Validations.prototype.hide_error).toHaveBeenCalledWith("uservalid")
     expect(window.Validations.prototype.hide_error).toHaveBeenCalledWith("emailvalid")

    it "shows the errors when incorrect", ->
     spyOn(window.Validations.prototype, 'is_required').andReturn(false)
     spyOn(window.Validations.prototype, 'is_valid_email').andReturn(false)
     window.button_click()
     expect(window.Validations.prototype.is_required).toHaveBeenCalledWith("test");
     expect(window.Validations.prototype.is_valid_email).toHaveBeenCalledWith("test")
     expect(window.Validations.prototype.show_error).toHaveBeenCalledWith("uservalid", " Username is empty\n")
     expect(window.Validations.prototype.show_error).toHaveBeenCalledWith("emailvalid", "The email is invalid";)
