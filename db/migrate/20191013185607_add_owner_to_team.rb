class AddOwnerToTeam < ActiveRecord::Migration[5.2]
  def change
    add_reference :teams, :owner
  end
end
