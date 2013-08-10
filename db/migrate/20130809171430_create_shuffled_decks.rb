class CreateShuffledDecks < ActiveRecord::Migration
  def change
    create_table :shuffled_decks do |t|
      t.string      :name
      t.belongs_to  :round
      t.timestamps
    end
  end
end
