class AddVotesToPeople < ActiveRecord::Migration
  def change
    add_column :people, :votes, :integer, :default => 0
  end
end
