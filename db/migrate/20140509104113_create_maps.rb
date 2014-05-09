class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :name
      t.references :node, index: true
      t.references :link, index: true
      t.references :user

      t.timestamps
    end
  end
end
