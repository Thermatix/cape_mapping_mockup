class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :company
      t.string :password
      t.references :map
      
      t.timestamps
    end
  end
end
