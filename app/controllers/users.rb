post '/users/login' do
  puts params[:post].inspect
  
  if User.authenticate(params[:post])
    @user = User.find_by_email(params[:post][:email])
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

get '/users/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/users/:user_name' do
  
  user = User.find_by_name(params[:user_name])
  authenticate_user(user.id, params[:user_name])
  @rounds = user.rounds.reverse

  @decks = Hash.new([])

  @rounds.each do |round|
    @decks[Deck.find(round.deck_id).name] += [round.score]
  end

  @decks.each do |key, value|
    @decks[key] = average_value(value).round
  end
  @user_name = user.name
  erb :user
end



