class Ability
  include CanCan::Ability

  def initialize(user, params)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      cannot :read, User
      
      if user.subjects.any?
        [MeasuringDevice, Audit, ActivityValue, Consumption, Production, HouseNumber, HouseKindNumber].each do |stat|
          can :manage, stat do |stat|
            user.subject_ids.include? stat.subject_id
          end
          if params[:subject_id] and not user.subject_ids.include? params[:subject_id].to_i
            cannot :manage, stat
          end
        end
      end

    end
  end
end
