class Invitation < ActiveRecord::Base
  has_one :response

  def self.for(name)
    query = '%' + name.to_s.split.join('%') + '%'
    results = where("name ilike ?", query)
    results.first if results.length == 1
  end

  def responded?
    !!response
  end

  def response_defaults
    attributes.slice('party_size')
  end
end
