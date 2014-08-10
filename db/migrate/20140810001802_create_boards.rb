class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :text
      t.text :full_text
      t.text :url
      t.date :payed_until
      t.float :lat
      t.float :long

      t.timestamps
    end
    
    add_index :boards, [:lat, :long], unique: false
  end
end