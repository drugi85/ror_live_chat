String::capitalize = ->
  new_str = @.trim()
  new_str.charAt(0).toUpperCase() + new_str.slice(1).toLowerCase()

String::humanize = ->
  new_str = @.replace(/[-_ ]+/g, ' ').trim();
  return new_str.charAt(0).toUpperCase() +
  new_str.slice(1).toLowerCase().replace(/[-_]+/g, ' ')

String::constantize = ->
   @.replace(/[-_ ]*[a-zA-Z]+[-_ ]*/g, (match) ->
   	new_string = match.replace(/[-_ ]/g, '')
   	new_string.charAt(0).toUpperCase() + new_string.slice(1)
   )
String::tableize = ->
  a = this.replace(/[!@#$%^&*()+}{'':>?<}]+/g, '');
  return a.replace(/[-_ ]+/g, '-');


console.log("   My name is Eric  ".capitalize());
console.log("___---lol----My_name is Eric".humanize())
console.log("-----My name is_Eric-----".constantize())
console.log("!@#$%^My name is Eric".tableize())