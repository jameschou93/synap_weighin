class AddPeopleToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :person_id, :integer
  end
end
