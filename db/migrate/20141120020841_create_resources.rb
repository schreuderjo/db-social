class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.string :url
      t.text :description
      t.boolean :global_resource, :default => false

      t.timestamps
    end
  end
end
