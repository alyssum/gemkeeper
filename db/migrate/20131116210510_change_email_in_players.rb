class ChangeEmailInPlayers < ActiveRecord::Migration
  def up
    change_column(:players, :email, :string, {default: nil, null: true})
  end

  def down
    change_column(:players, :email, :string, {default: "", null: false})
  end
end
