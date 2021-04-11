module DeviseHelper
  def bootstrap_devise_error_messages!
    return "" if resource.errors.empty?

    html = ""
    resource.errors.full_messages.each do |error_message|
      html += <<-EOF
      <div class="alert alert-danger alert-dismissible" role="alert">
        #{error_message}
      </div>
      EOF
    end
    html.html_safe
  end

  def bootstrap_alert(key)
    case key
    when "alert"
      "danger"
    when "notice"
      "success"
    when "error"
      "danger"
    end
  end

end