class PasswordManager2

  def initialize
    @password_container = Array.new
  end

  def password_in_use?(password)
    stored_password = Array.new
    @password_container.each { |stored_item| stored_password.push(stored_item["password"]) }
    return stored_password.include?(password)
  end


  def add(service, password)
    if password_in_use?(password)
      return "ERROR: Passwords must be unique"
    elsif services.include?(service)
      return "ERROR: Service names must be unique"
    else
      @password_container.push({"service" => service, "password" => password, "added_on" => Date.today} )
    end
  end

  def remove(service)
    @password_container.each { |stored_item| stored_item["service"] == service ? @password_container.delete(stored_item) : return }
  end

  def update(service, new_password)
    found_service = @password_container.find { |stored_item| stored_item["service"] == service }

    if password_in_use?(new_password)
      return "ERROR"
    else 
      found_service["password"] = new_password
    end
  end

  def services
    stored_services = Array.new
    @password_container.each { |stored_item| stored_services.push(stored_item["service"])}
    return stored_services
  end

  def password_for(service)
    found_service = @password_container.find { |stored_item| stored_item["service"] == service }
    return found_service["password"]
  end

  def sort_by(sort_choice)
    if sort_choice == "service"
      return services.sort
    elsif sort_choice == "added_on"
      sorted_array = @password_container.sort_by { |stored_item| stored_item["added_on"]}
      sorted_service_names = Array.new
      sorted_array.each { |stored_item| sorted_service_names.push(stored_item["service"]) }
      return sorted_service_names
    else 
      return "error"
    end

  end

end
