class Invitation < ActiveRecord::Base
  has_one :response, dependent: :destroy

  scope :no_response, -> { includes(:response).references(:responses).where(responses: {id: nil}) }
  scope :responded, -> { joins(:response) }


  def self.for(name)
    terms = name.to_s.split
    results = terms.inject(self) do |query, term|
      if (term == 'and' || term == '&')
        query
      else
        query.where("name ilike ?", "%#{term}%")
      end
    end
    results.first if results.length == 1
  end

  def responded?
    !!response
  end

  def to_response(params = {})
    build_response(response_defaults.merge(params))
  end

  def party_size
    read_attribute(:party_size) || 10
  end

  def response_defaults
    attributes.slice('party_size')
  end
end
