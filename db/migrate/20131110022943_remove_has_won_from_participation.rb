class RemoveHasWonFromParticipation < ActiveRecord::Migration
  def change
    remove_column :participations, :has_won, :boolean
  end
end
