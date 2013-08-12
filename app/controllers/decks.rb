get '/:user_name/decks' do
  @user_name = params[:user_name] 
  @decks = Deck.all
  erb :decks
end

get '/:user_name/decks/:deck_name/create_round' do
  authenticate_user(session[:user_id], params[:user_name])

  #create a round
  @deck = Deck.find_by_name(params[:deck_name])
  @round = Round.create(user_id: current_user.id, deck_id: @deck.id)
  
  #create a shuffled deck
  @shuffled_deck = ShuffledDeck.create(name: @deck.name, round_id: @round.id)
  
  #create the cards for the shuffled deck
  @deck.cards.each do |card|
     ShuffledDeckCard.create(question: card.question, answer: card.answer, shuffled_deck_id: @shuffled_deck.id)
  end

  @user_name = params[:user_name]
  #route to '/decks/:deck_name/:round/:card_id'
  redirect to "/#{@user_name}</er>/:user_name/decks/#{@shuffled_deck.id}/#{@round.id}" 
end

get '/:user_name/decks/:shuffled_deck_id/:round_id' do

  authenticate_user(session[:user_id], params[:user_name])
  
  #get an array of unused cards, save a random one to a var to pass to the 
  cards = []
  cards = ShuffledDeckCard.where(shown: false, shuffled_deck_id: params[:shuffled_deck_id])
  if cards.empty?
    redirect to "/#{params[:user_name]}/rounds/#{params[:shuffled_deck_id]}/score"
  end

  @card = cards.sample
  @round_id = params[:round_id]
  @shuffled_deck_id = params[:shuffled_deck_id]
  @user_name = params[:user_name]
  erb :question
#shuffle here, pass the current card to a view
end

post '/:user_name/decks/:shuffled_deck_id/:round_id' do

  authenticate_user(session[:user_id], params[:user_name])

  card_id = params[:card_id]
  
  @card = ShuffledDeckCard.find(card_id)
  @card.shown = true
  @card.correct = (@card.answer.strip.downcase == params[:answer].strip.downcase)
  @card.save
  @shuffled_deck_id = params[:shuffled_deck_id]
  @round_id = params[:round_id]  
  @user_name = params[:user_name]
  erb :results

  # redirect to "/decks/#{params[:shuffled_deck_id]}/#{params[:round_id]}"

end
