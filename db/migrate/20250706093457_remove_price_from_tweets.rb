class RemovePriceFromTweets < ActiveRecord::Migration[7.2]
  def change
    remove_column :tweets, :price, :integer
  end
end
