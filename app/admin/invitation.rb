ActiveAdmin.register Invitation do
  includes :response
  scope :no_response
  scope :responded

  index do
    selectable_column
    column :name, sortable: 'invitation.name' do |response|
      link_to response.name, admin_response_path(response)
    end
    column :party_size
    column :response, sortable: 'response.responded_with' do |invitation|
      if invitation.response
        link_to invitation.response.responded_with, admin_response_path(invitation.response)
      end
    end
    column :created_at
    column :updated_at
    actions
  end


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
