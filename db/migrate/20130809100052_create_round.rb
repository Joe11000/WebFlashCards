class CreateRound < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.belongs_to :user
      t.belongs_to :deck
      t.integer    :score
      
      t.timestamps
    end
  end
end
