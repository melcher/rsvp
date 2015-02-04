require 'rails_helper'

RSpec.describe Invitation, :type => :model do
  describe '.for' do
    subject(:for) { Invitation.for(query) }
    let!(:invitation){ Invitation.create(name: "Graham & Jess Melcher") }
    ['GRAHAM', 'graham', 'graham melcher', 'jess melcher', 'graham jess', 'jess graham'].each do |match|
      describe "matching query (#{match})" do
        let(:query) { match }
        it{ should == invitation }
      end
    end
    ['grahams', 'melchers', 'jessica', 'Graham Jr'].each do |mismatch|
      describe "matching query (#{mismatch})" do
        let(:query) { mismatch }
        it{ should == nil }
      end
    end
    context 'with multiple matches' do
      let!(:invitation2) { Invitation.create(name: "Graham & Jess Melcher 2") }
      let(:query) { 'Graham' }
      it{ should == nil }
    end
  end
end
