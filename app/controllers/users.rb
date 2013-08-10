get 'users/:user_name' do

  erb :user
end

post '/users/login' do

  if User.authenticate(params[:email], params[:password])
    @user = User.find_by_email(params[:email])
    session[:user_id] = @user.id 
    redirect "/users/#{@user.id}"
  else
    redirect '/'
  end
end

post '/users/new' do

  @user = User.create(params[:post])
  session[:user_id] = @user.id 
  redirect "/users/#{@user.name}"
end


post '/users/logout' do

  session[:user_id] = nil
  redirect '/'
end
