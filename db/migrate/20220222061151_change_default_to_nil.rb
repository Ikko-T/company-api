class ChangeDefaultToNil < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :gender, nil
  end
end
