class AddFullNameToUser < ActiveRecord::Migration[5.0]
  def change
    def change
			add_column :users, :first_name, :string
			add_column :users, :second_name, :string
	  end
  end
end
