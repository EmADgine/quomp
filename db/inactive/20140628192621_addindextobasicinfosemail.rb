class Addindextobasicinfosemail < ActiveRecord::Migration
    def up
        add_index :basicinfos, :email, unique: true
        add_column :basicinfos, :password_digest, :string
    end
end
