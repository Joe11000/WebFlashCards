def current_user
  User.find(session[:user_id]) if session[:user_id]
end

def average_values(num_arr)

end
