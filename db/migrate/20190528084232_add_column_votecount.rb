class AddColumnVotecount < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :vote_log_count, :integer, default: 0
  end
end
