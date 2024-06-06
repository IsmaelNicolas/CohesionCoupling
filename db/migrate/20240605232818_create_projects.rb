class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :leader_id

      t.timestamps
    end
  end
end
