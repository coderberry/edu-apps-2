class AddRemoteUidToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :remote_uid, :string
  end
end
