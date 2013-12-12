class AddCurrency < ActiveRecord::Migration
	class Job < ActiveRecord::Base
	end

  def change
  	add_column :jobs, :currency, :string
  	Job.reset_column_information
  	reversible do |dir|
  		dir.up {
  			Job.update_all currency: 'dollars'
  		}
  	end
  end
end
