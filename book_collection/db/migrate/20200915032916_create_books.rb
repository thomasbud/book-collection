class CreateBooks < ActiveRecord::Migration[6.0]
  
  def up
    create_table :books do |t|
      t.string "title", :default => ''
      t.string "author", :default => ''
      t.string "genre", :default => ''
      t.column "price", :decimal, :default => 0, :precision => 20, :scale => 2
      t.string "published_date", :default => ''

      t.timestamps
    end
  end

  def down
    drop_table :books
  end

end
