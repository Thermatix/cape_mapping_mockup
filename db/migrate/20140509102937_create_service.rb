class CreateService < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.text :descriptor
      t.references :services, index: true

      t.timestamps
    end
  end
end

