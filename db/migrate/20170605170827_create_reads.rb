class CreateReads < ActiveRecord::Migration[5.0]
  def change
    create_table :reads do |t|
      t.integer :user_id
      t.references :url, foreign_key: true

      t.timestamps null: false
    end
  end
end
