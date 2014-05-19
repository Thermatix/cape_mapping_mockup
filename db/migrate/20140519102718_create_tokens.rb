class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.references :user, index: true
      t.string :auth_code
      t.string :auth_token
      t.string :refresh_token
      t.datetime :auth_life
      t.datetime :refresh_life
    end
  end
end
