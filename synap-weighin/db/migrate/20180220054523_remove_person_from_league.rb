class RemovePersonFromLeague < ActiveRecord::Migration
  def change
    remove_column :leagues, :person_id, :string
  end
end
