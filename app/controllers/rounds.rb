get '/rounds/:shuffled_deck_id/score' do
  
  @cards = ShuffledDeckCard.where(shuffled_deck_id: params[:shuffled_deck_id])

  number_of_correct = @cards.correct.size
  total = @cards.size

  percent = ( (number_of_correct / total.to_f) * 100 ).round.to_i
  #display it next to a percentage sign

  round = ShuffledDeck.find(params[:shuffled_deck_id]).round

  round.score=(percent)
  #page that tells the person if they got the question right or wrong
  #lets a person go to the enxt card ('/decks/:deck_name/:round/:card_id')
  round.save

  user_name = round.user.name

  redirect "/users/#{user_name}"
end
#clicked premade deck hyperlink, starts at the first card, then goes to the next etc
#the view has a form that routes to '/decks/score/form'


#4
