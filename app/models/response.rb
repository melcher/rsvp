class ResponseOption
  attr_accessor :id, :name
  def initialize(name)
    @name = name
    @id = name.gsub(/\s/,'').underscore
  end
end
class Response < ActiveRecord::Base
  belongs_to :invitation

  validates :party_size, :numericality => { :less_than_or_equal_to => 100 }

  validate :party_size_isnt_too_big
  def self.possible_responses
    [
      ResponseOption.new('Enthusiastically Accept'),
      ResponseOption.new('Regretfully Decline'),
      ResponseOption.new('Enthusiastically Decline'),
      ResponseOption.new('Regretfully Accept'),
      ResponseOption.new('Will Decline to Respond but Ultimately Attend')
    ]
  end

  def party_size_isnt_too_big
    if invitation.try(:party_size) && party_size && party_size > invitation.party_size
      self.errors.add(:base, "We're sorry but your party size is limited to #{invitation.party_size}")
    end
  end

  def self.from_invitation(invitation)
    invitation.build_response.tap do |response|
      response.attributes = invitation.response_defaults
    end
  end
end
