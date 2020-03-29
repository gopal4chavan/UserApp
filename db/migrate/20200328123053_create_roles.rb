class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name
      t.boolean :hidden

      t.timestamps
    end
  end
end
