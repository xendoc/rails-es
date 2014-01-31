class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :kana
      t.float :lat, limit: 53
      t.float :lng, limit: 53
      t.integer :category
      t.boolean :has_coupon

      t.timestamps
    end
  end
end
