
post '/users/login' do
  puts params[:post].inspect
  
  if User.authenticate(params[:post])
    @user = User.find_by_email(params[:post][:email])
    puts @user
    session[:user_id] = @user.id 
    redirect "/users/#{@user.name}"
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

get '/users/:user_name' do
  @user = User.find_by_name(params[:user_name])
  erb :user
end
