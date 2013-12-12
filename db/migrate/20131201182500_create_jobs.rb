class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string "title"
      t.text "details"
      t.string "pay_type"
      t.string "work_unit"
      t.decimal "pay_rate", :precision => 10, :scale => 2
      t.timestamps
    end
  end
end
