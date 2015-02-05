class Invitation < ActiveRecord::Base
  has_one :response

  def self.for(name)
    terms = name.to_s.split
    results = terms.inject(self) do |query, term|
      next if (term == 'and' || term == '&')
      query.where("name ilike ?", "%#{term}%")
    end
    results.first if results.length == 1
  end

  def responded?
    !!response
  end

  def to_response(params = {})
    build_response(response_defaults.merge(params))
  end

  def response_defaults
    attributes.slice('party_size')
  end
end
