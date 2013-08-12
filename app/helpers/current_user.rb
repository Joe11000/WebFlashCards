require 'debugger'
def current_user
  User.find(session[:user_id]) if session[:user_id]
end

def average_value(num_arr)
  num_arr.reduce(:+).to_f / num_arr.size
end

def authenticate_user(user_id, name_of_user)
  #debugger
  if User.find_by_id_and_name(user_id, name_of_user).nil?
    #debugger
    redirect to '/'
  end
end

   
