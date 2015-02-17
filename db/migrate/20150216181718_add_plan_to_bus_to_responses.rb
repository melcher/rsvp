class AddPlanToBusToResponses < ActiveRecord::Migration
  class Response < ActiveRecord::Base; end
  def change
    add_column :responses, :plan_to_bus, :boolean, default: false
    reversible do |dir|
      dir.up{ Response.update_all(plan_to_bus: false) }
    end
  end
end
