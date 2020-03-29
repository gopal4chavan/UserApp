class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, unique: true
      t.text :roles
      t.text :meta_cols

      t.timestamps
    end
  end
end

