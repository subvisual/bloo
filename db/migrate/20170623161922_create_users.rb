class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :device
    end

    add_index :users, [:username, :device], unique: true
  end
end
