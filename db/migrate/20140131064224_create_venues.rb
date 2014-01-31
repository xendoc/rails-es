class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :kana
      t.float :lat
      t.float :lng
      t.integer :category
      t.boolean :has_coupon

      t.timestamps
    end
  end
end
