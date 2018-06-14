class CreateCarModels < ActiveRecord::Migration[5.1]
  def change
    create_table :car_models do |t|
       t.string :manufacturer, default: ""
       t.string :model, default: ""
    end
  end
end
