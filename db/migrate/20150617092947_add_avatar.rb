class AddAvatar < ActiveRecord::Migration
  def change
    add_column :people, :avatar, :string
  end
end
