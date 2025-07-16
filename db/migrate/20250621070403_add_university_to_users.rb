class AddUniversityToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :university, :string
  end
end
