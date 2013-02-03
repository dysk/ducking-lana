class AddDeviseColumnsToAdmins < ActiveRecord::Migration
  def change
    # t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

    add_column :admins, :failed_attempts, :integer, default: 0
    add_column :admins, :unlock_token, :string
    add_column :admins, :locked_at, :datetime
  end
end
