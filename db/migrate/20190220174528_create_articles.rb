class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.string :recruiting
      t.text :skills
      t.string :employability
      t.string :country
      t.string :city
      t.string :street

      t.timestamps
    end
  end
end
