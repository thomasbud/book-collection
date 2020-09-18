class AlterBook < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:books, :published_date, nil)
  end
end
