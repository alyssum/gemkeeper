class AddCreatedByToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :created_by, :integer, :default => 1
  end
end
