class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.references :Tipable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
