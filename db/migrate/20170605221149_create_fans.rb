class CreateFans < ActiveRecord::Migration[5.0]
  def change
    create_table :fans do |t|
      t.string :name
      t.string :email
      t.string :city
      t.string :state
      t.string :country
      t.text :message

      t.timestamps
    end
  end
end
