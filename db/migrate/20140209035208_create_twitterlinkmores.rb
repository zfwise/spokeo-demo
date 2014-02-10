class CreateTwitterlinkmores < ActiveRecord::Migration
  def change
    create_table :twitterlinkmores do |t|
      t.string :name
      t.text :link
      t.string :verified
      t.float :fans
      t.integer :certaintylevel

      t.timestamps
    end
  end
end
