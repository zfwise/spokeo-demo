class CreateTwitterlinks < ActiveRecord::Migration
  def change
    create_table :twitterlinks do |t|
      t.string :name
      t.text :link

      t.timestamps
    end
  end
end
