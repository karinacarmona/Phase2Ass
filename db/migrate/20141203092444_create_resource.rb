class CreateResource < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :resource_url
      t.references :post
      t.references :user

      t.timestamps
    end
  end
end
