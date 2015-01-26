class RenameInvitationsToInvitation < ActiveRecord::Migration
  def change
    rename_column :responses, :invitations_id, :invitation_id
  end
end
