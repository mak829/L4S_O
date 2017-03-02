class CreateColorcodes < ActiveRecord::Migration[5.0]
  def change
    create_table :colors do |t|
      t.string  :code
      t.integer :image_id
    end
  end
end

