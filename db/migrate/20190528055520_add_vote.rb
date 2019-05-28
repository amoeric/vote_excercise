class AddVote < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :votes, :integer, default: 0
  end
end
