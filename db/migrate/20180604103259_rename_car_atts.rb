class RenameCarAtts < ActiveRecord::Migration[5.1]
  def change
    rename_table :car_atts, :car_attributes
  end
end
