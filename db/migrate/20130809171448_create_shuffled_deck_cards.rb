class CreateShuffledDeckCards < ActiveRecord::Migration
  def change
    create_table :shuffled_deck_cards do |t|
      t.string :question
      t.string :answer
      t.boolean :shown, default: false
      t.boolean :correct, default: false
      t.belongs_to :shuffled_deck
    end
  end
end
