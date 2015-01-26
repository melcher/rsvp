class Invitation < ActiveRecord::Base
  has_one :response
end
