class AddFieldToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :owner_id, :integer
  end
end
