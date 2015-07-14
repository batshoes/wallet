class ChangeTypeToBrand < ActiveRecord::Migration
  def change
    change_column(:cards, :type, :brand)
  end
end
