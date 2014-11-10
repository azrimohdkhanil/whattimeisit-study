class CreateTimezones < ActiveRecord::Migration
  def change
    create_table :timezones do |t|
      t.string :region
      
      t.timestamps
    end

    add_column :timezones, :user_id, :integer
  end
end
