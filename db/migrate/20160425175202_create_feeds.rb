class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.text :location

      t.timestamps null: false
    end
  end
end
