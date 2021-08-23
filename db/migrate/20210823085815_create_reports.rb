class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string      :title,  null: false, limit: 30
      t.text        :text,   null: false
      t.timestamps
    end
  end
end
