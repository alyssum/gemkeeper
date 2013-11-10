class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.integer :session_id
      t.integer :player_id
      t.integer :role_id
      t.integer :score
      t.boolean :has_won

      t.timestamps
    end
  end
end
