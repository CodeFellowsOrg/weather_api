class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.string :state
      t.string :location
      t.string :temp

      t.timestamps
    end
  end
end
