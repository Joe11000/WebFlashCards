def current_user
  User.find(session[:user_id]) if session[:user_id]
end

def average_value(num_arr)
  num_arr.reduce(:+).to_f / num_arr.size
end
