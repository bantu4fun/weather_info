class CreateWeatherLogs < ActiveRecord::Migration
  def change
    create_table :weather_logs do |t|
      t.string :location
      t.string :date
      t.string :temp
      t.string :string
      t.string :sky
      t.string :humidity
      t.string :pressure

      t.timestamps null: false
    end
  end
end
