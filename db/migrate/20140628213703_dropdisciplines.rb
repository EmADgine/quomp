class Dropdisciplines < ActiveRecord::Migration
  def change
      drop_table :disciplines
  end
end
