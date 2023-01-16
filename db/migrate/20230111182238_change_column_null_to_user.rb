class ChangeColumnNullToUser < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :username, true
    change_column_default :users, :username, nil
  end
end
