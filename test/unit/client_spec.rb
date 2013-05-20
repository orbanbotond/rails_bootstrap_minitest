require 'spec_helper'

describe Client do

  describe 'methods' do
    subject do
      u = Client.new
    end

    describe 'associations' do
      it { must have_many(:users)}
      it { must have_many(:agreements)}
      it { must belong_to(:purchasing_system)}
      it { must belong_to(:system_version)}
    end

    describe 'fields' do
      it { subject.must_respond_to(:name)}
      it { subject.must_respond_to(:ac_number)}
      it { subject.must_respond_to(:authentication_key)}
      it { subject.must_respond_to(:purchasing_system)}
      it { subject.must_respond_to(:system_version)}
      it { subject.must_respond_to(:category_schema)}
      it { subject.must_respond_to(:account_status)}
      it { subject.must_respond_to(:comment)}
      it { subject.must_respond_to :deleted_at }
    end

    describe 'methods' do
      it {subject.must_respond_to(:products)}
    end
  end

  describe 'auto generated fields' do
    subject do
      u = Factory :client
    end

    it { subject.ac_number.should.not.be.nil }
    it 'should be the same after save' do
      supplier = subject
      n = supplier.ac_number
      supplier.name = 'asd'
      supplier.save
      supplier.ac_number.should == n
    end
  end

  describe 'validations' do

    describe 'negative' do
      it { Factory.build( :client, :name => nil).valid?.should.not.equal true }
      it { Factory.build( :client, :name => 'a' *201).valid?.should.not.equal true }
      it { Factory.build( :client, :authentication_key => nil).valid?.should.not.equal true }
    end

    describe 'positive' do
      it { Factory.build( :client, :name => 'a' *200).valid?.should.be true }
    end
  end

end
