class CreateFilms < ActiveRecord::Migration[6.0]
  def change
    create_table :films do |t|

      t.string :title
      t.string :plot
      t.string :url
      t.date :date
      t.integer :booked
      
      t.timestamps
    end
  end
end
