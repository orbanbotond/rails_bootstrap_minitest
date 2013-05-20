# == Schema Information
#
# Table name: clients
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  ac_number            :string(255)
#  authentication_key   :string(255)
#  category_schema      :string(255)
#  account_status       :string(255)
#  comment              :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  deleted_at           :time
#  purchasing_system_id :integer
#  system_version_id    :integer
#

class Client < ActiveRecord::Base
  include Administratable

  acts_as_paranoid

  encrypted_id key: '584acfdbf83bd1009f1bf376bcaceb710'

  # This is the buyer
  attr_accessible  :name, :authentication_key, :purchasing_system_id, :system_version_id, :category_schema

  has_many :users, :as => :administratable
  has_many :agreements
  belongs_to :purchasing_system
  belongs_to :system_version

  validates :name, 
      :length => { :maximum => 200 },
      :presence => true
  validates :authentication_key, 
      :presence => true

  scope :including_purchasing_system, includes(:purchasing_system)
  scope :including_system_version, includes(:system_version)

  before_create :generate_ac_number

  after_update :update_index_for_prices
  after_destroy :destroy_index_for_agreements
 
private

  def generate_ac_number
    begin
      self.ac_number = Array.new(10){|i|rand(10)}.join
    end while Supplier.find_by_ac_number(self.ac_number).present?
  end

  def destroy_index_for_agreements
    agreements.each { |agreement| agreement.destroy_index_for_prices }
  end

  def update_index_for_prices
    agreements.each { |agreement| agreement.update_index_for_prices }
  rescue
    puts "Exception was thrown"
  end

end
