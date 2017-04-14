class CreateMyheros < ActiveRecord::Migration[5.0]
  def change
    create_table :myheros do |t|
      t.string :name
      t.string :power
      t.string :prefix
      t.string :suffix
      t.string :descriptor

      t.timestamps
    end
  end
end
