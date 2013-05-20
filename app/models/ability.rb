class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
      cannot :destroy, Agreement
      cannot :destroy, Client
      cannot :destroy, Supplier
    elsif user.buyer?
      can [:upload_form, :upload], Product
      can :read, Product
      can :search, Product
      can [:read, :update], Client, :id => user.administratable_id if user.administratable_type == Client.to_s
      can [:read, :create, :update], Agreement, :client_id => user.administratable_id if user.administratable_type == Client.to_s
      can [:read, :create, :update], User do |u|
        (user.administratable_type == Client.to_s && user.administratable.users.map{|x|x.id}.include?(u.id))||(user.administratable_type == u.administratable_type && user.administratable_id == u.administratable_id)
      end

      can :read, Supplier

    elsif user.supplier?
      can [:upload_form, :upload], Product
      can :search, Product
      can [:destroy], Product do |p|
        user.administratable.agreements.any?{|a| p.agreements.any?{|aa| a == aa }} 
      end
      can [:read, :create, :update], Product do |p|
        user.administratable.agreements.any?{|a| p.agreements.any?{|aa| a == aa }} 
      end

      can [:read, :update], Agreement, :supplier_id => user.administratable_id if user.administratable_type == Supplier.to_s
      can [:read, :create, :update], User do |u|
        (user.administratable_type == Supplier.to_s && user.administratable.users.map{|x|x.id}.include?(u.id))||(user.administratable_type == u.administratable_type && user.administratable_id == u.administratable_id)
      end
      can [:read, :update], Supplier, :id => user.administratable_id if user.administratable_type == Supplier.to_s

    end
    # :read, :create, :update and :destroy
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
