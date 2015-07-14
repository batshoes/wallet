class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :cc
      t.string :brand
      t.integer :xmonth
      t.integer :xyear
      t.timestamps null: false
    end
  end
end
