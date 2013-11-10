class AddStalemateToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :is_stalemate, :boolean
  end
end
