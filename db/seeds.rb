joe = User.create(name: "Joe", password: "joe", email: "joe@dbc.com")
colleen = User.create(name: "Colleen", password: "colleen", email: "colleen@dbc.com")
ned = User.create(name: "Ned", password: "ned", email: "ned@dbc.com")
mark = User.create(name: "Mark", password: "mark", email: "mark@dbc.com")

marky_mark = Deck.create(name: "Good Migrations")
Card.create(question: "How are you feeling?", answer: "feeling good vibrations", deck_id: marky_mark.id)
Card.create(question: "What kind of vibrations?", answer: "good vibrations", deck_id: marky_mark.id)

colors = Deck.create(name: "Spanish to English Colors")
Card.create(question: "azul", answer: "blue", deck_id: colors.id)
Card.create(question: "blanco", answer: "white", deck_id: colors.id)
Card.create(question: "rojo", answer: "red", deck_id: colors.id)
Card.create(question: "verde", answer: "green", deck_id: colors.id)
Card.create(question: "rosado", answer: "pink", deck_id: colors.id)

# ShuffledDeck.create()
# ShuffledDeckCard.create()

# Round.create(user_id: 1, deck_id: 1, score: 2)

# Deck.all.each do |deck|
#   ShuffledDeck.create(name: deck.name, round_id: 1)
#   deck.cards.each do |card|
#   ShuffledDeckCard.create(question: card.question, answer: card.answer,
#    shuffled_deck_id: deck.id)
#   end
# end

# rake db:drop && rake db:create && rake db:migrate && rake db:seed
