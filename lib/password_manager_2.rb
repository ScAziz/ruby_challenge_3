# As a user of Password Manager 2.0 I want to be able to add a new, secure and unique password.
# I want to be able to view all services I have passwords stored for and have them sorted for me, 
# either by alphabetically by service or date added. 

# I would like to be able to delete services and their associated passwords


# Helper functions
  # password validator
  # check if service exists

#add
  # check if password is valid - not on tests yet, tackle later, as for below.
  # store the new service and password 
  # store the date the password was added 

# sort_by
#   takes 1 string as an arg, either service or added on
#   sort stored by either service name or date added 
#   return sorted list

# password_for
#   returns password for service 

# update
#   takes 2 strings as args, service name and new password 
#   check if service exists
#   check if password is valid
#   check if password is in use
#   update password for that service


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
      @password_container.push({"service" => service, "password" => password} )
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
end
