class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name   # カラムを追加
      t.integer :price  # カラムを追加
      t.timestamps
    end
  end
end
