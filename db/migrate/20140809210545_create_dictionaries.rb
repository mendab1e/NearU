class CreateDictionaries < ActiveRecord::Migration
  def change
    create_table :dictionaries do |t|
      t.string :bigram
      t.integer :count, default: 0
      t.integer :weight, default: 0

      t.timestamps
    end
    
    add_index :dictionaries, :bigram
  end
end