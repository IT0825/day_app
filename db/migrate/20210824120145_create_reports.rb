class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string      :title,  null: false, limit: 30
      t.text        :text,   null: false
      t.references :user,   null: false, foreign_key:true
      t.timestamps
    end
  end
end
