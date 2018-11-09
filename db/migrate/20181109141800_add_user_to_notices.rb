class AddUserToNotices < ActiveRecord::Migration[5.2]
    def change
      add_column :notices, :user_id, :integer
    end
end
