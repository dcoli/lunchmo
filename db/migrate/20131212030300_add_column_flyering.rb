class AddColumnFlyering < ActiveRecord::Migration
  def change
  	add_column( :jobs, :flyering, :boolean )
  end
end
