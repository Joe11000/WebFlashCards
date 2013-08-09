User.create(name: "Joe", password_digest: "a", email: "hi@me.com")
Round.create(user_id: 1, deck_id: 1, score: 2)
Deck.create(name: "test")
Card.create(question: "how are you?", answer: "feeling good vibrations", deck_id: 1)
Card.create(question: "how old are you?", answer: "feeling good vibrations", deck_id: 1)

# ShuffledDeck.create()

# ShuffledDeckCard.create()


Deck.all.each do |deck|
  ShuffledDeck.create(name: deck.name, round_id: 1)
  deck.cards.each do |card|
  ShuffledDeckCard.create(question: card.question, answer: card.answer,
   shuffled_deck_id: deck.id)
  end
end



