class Addresumecolumnstodisciplines < ActiveRecord::Migration
  def change
      add_attachment :disciplines, :portfolio
  end
end
