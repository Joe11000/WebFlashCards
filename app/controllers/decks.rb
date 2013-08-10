get '/decks' do 
  @decks = Deck.all
  erb :decks
end

get '/decks/:deck_name/create_round' do
  #create a round
  @deck = Deck.find_by_name(params[:deck_name])
  @round = Round.create(user_id: current_user.id, deck_id: @deck.id)
  
  #create a shuffled deck
  @shuffled_deck = ShuffledDeck.create(name: @deck.name, round_id: @round.id)
  
  #create the cards for the shuffled deck
  @deck.cards.each do |card|
     ShuffledDeckCard.create(question: card.question, answer: card.answer, shuffled_deck_id: @shuffled_deck.id)
  end

  #route to '/decks/:deck_name/:round/:card_id'
  redirect to "/decks/#{@shuffled_deck.id}/#{@round.id}" 
end

get '/decks/:shuffled_deck_id/:round_id' do
  
  #get an array of unused cards, save a random one to a var to pass to the 
  cards = []
  cards = ShuffledDeckCard.where(shown: false, shuffled_deck_id: params[:shuffled_deck_id])
  if cards.empty?
    redirect to "/rounds/#{params[:shuffled_deck_id]}/score"
    
  end
  @card = cards.sample
  @round_id = params[:round_id]
  @shuffled_deck_id = params[:shuffled_deck_id]
  # if params[:card_id] + 1 > 
  
  erb :question
#shuffle here, pass the current card to a view
end

post '/decks/:shuffled_deck_id/:round_id' do
  card_id = params[:card_id]
  
  @card = ShuffledDeckCard.find(card_id)
  @card.shown = true
  @card.correct = (@card.answer.strip.downcase == params[:answer].strip.downcase)
  @card.save
  @shuffled_deck_id = params[:shuffled_deck_id]
  @round_id = params[:round_id]  
  
  erb :results

  # redirect to "/decks/#{params[:shuffled_deck_id]}/#{params[:round_id]}"

end


