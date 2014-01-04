class AddTimeToJob < ActiveRecord::Migration
  def change
  	add_column :jobs, :job_time, :datetime
  end
end
