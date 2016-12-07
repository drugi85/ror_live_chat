describe "Validations", () ->
  validator = {}
  beforeEach ->
    validator = new Validations()
  

  describe "is required", () ->
    string = null
    beforeEach ->
      string = {
        trim: ->
          this
      }
      spyOn(string, "trim")

    it "deletes whitespaces from string from beginning and end", ->
      validator.is_required(string)   
      expect(string.trim).toHaveBeenCalled()
    it "checks string is required", ->
      expect(true).toEqual validator.is_required("test")   
    it "checks string is not required", ->
      expect(false).toEqual validator.is_required("")

  describe "is valid email", () ->
    email = null
    beforeEach ->
      email = "email@email.com"
      
    it "verifies email is required", ->
      spyOn(validator,"is_required")
      validator.is_valid_email(email)   
      expect(validator.is_required).toHaveBeenCalledWith(email) 

    it "checks string has valid email", ->
      expect(true).toEqual validator.is_valid_email("test@test.com")
    it "checks string has invalid email", ->
      expect(false).toEqual validator.is_valid_email("testtest.com")
  
  describe "hide_error", () ->

    it "finds the element", ->
      spyOn(window, "$").andCallThrough()
      id = "some_id"
      validator.hide_error(id)
      expect(window.$).toHaveBeenCalledWith("#"+id) 
    it "hides the element", ->
      spyOn(window.$.fn, 'css')
      id = "some_id"
      validator.hide_error(id)
      expect(window.$.fn.css).toHaveBeenCalledWith("display", "none")
 
  describe "show_error",() ->
    
    it "finds the element" , ->
      spyOn(window, "$").andCallThrough()
      id = 'id'
      message = "some error message"
      validator.show_error(id, message)
      expect(window.$).toHaveBeenCalledWith("#"+id)
    
    it "sets the correct background" , ->
      spyOn(window.$.fn, 'css')
      id = "id"
      message = "some error message"
      validator.show_error(id, message)
      expect(window.$.fn.css).toHaveBeenCalledWith({
        background: "red",
        display: "block",
        width: "auto",
        margin: "20px 0px 0px 0px"
      })
      
     it "sets the correct html" , ->
      spyOn(window.$.fn, 'html')
      id = "id"
      message = "some error message"
      validator.show_error(id, message)
      expect(window.$.fn.html).toHaveBeenCalledWith(message.trim())

     it "sets the error message and trims whitespaces", ->
      message = " some error message with whitespaces "
      spyOn(String.prototype, "trim")
      id = "id"
      validator.show_error(id, message)
      expect(message.trim).toHaveBeenCalled()
  

