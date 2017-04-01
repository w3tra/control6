class CreateImageComments < ActiveRecord::Migration[5.0]
  def change
    create_table :image_comments do |t|
      t.text :body
      t.integer :rating
      t.references :user, foreign_key: true
      t.references :image, foreign_key: true

      t.timestamps
    end
  end
end
