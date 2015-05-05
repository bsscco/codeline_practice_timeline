class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
			t.integer :post_id
			t.string	:writer
			t.string	:content
      t.timestamps
    end
  end
end
