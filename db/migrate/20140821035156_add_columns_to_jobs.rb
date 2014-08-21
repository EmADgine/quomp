class AddColumnsToJobs < ActiveRecord::Migration
  def change
      add_column :jobs, :name, :string
      add_column :jobs, :business_description, :string
      add_column :jobs, :transaction_frequency, :integer
  end
end
