class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|

      t.string :name
      t.integer :cel
      t.integer :id_user
      t.string :email
      t.string :film
      t.date :date

      t.timestamps
    end
  end
end
