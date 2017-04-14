class CreateHeros < ActiveRecord::Migration[5.0]
  def change
    create_table :heros do |t|
      t.string :name
      t.string :power
      t.string :prefix
      t.string :suffix
      t.string :discriptor

      t.timestamps
    end
  end
end