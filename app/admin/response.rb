ActiveAdmin.register Response do

  permit_params :invitation_id, :party_size, :responded_with, :comment, :food_restrictions

  belongs_to :invitation, optional: true
  includes :invitation
  index do
    selectable_column
    column :name, sortable: 'invitation.name' do |response|
      link_to response.name, admin_response_path(response)
    end
    column :responded_with
    column :party_size
    column :comment
    column :food_restrictions
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :invitation, as: :select, collection: Invitation.all.map{|i| [i.name, i.id] }, :input_html => { disabled: f.object.persisted? }
      f.input :party_size, as: :select, collection: 0..10
      f.input :responded_with, :as => :select, :collection => Response.possible_responses.map {|response| [response.name, response.id] }
      f.input :comment, as: :string
      f.input :food_restrictions, as: :string
    end
    f.actions
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
