class CreateHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtags do |t|
      t.string :name
      t.integer :post_id, foreign_key: true

      t.timestamps
    end
  end
end
