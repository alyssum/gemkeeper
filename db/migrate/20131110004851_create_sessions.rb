class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :game_id
      t.timestamp :date
      t.text :comments

      t.timestamps
    end
  end
end
