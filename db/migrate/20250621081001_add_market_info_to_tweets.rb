class AddMarketInfoToTweets < ActiveRecord::Migration[7.2]
  def change
    add_column :tweets, :product_name, :string
    add_column :tweets, :price, :integer
    add_column :tweets, :university, :string
    add_column :tweets, :lecture, :string
  end
end
