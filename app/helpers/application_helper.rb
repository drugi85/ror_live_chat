module ApplicationHelper

  def show_model_attr_error(model, field)
    html = ''
    if  model && field && model.errors[field.to_sym].any?
      html << "<div class='validation_error'>"
      html << "<ul>"
      model.errors[field.to_sym].each do |msg|
        html << "<li>#{field} #{msg}</li>"
      end
      html << "</ul>"
      html << "</div>"
    end
    return html.html_safe

  end


end
