class Ability
    include CanCan::Ability
    include SessionHelper
    def initialize(user)
        user ||=  User.new # guest user (not logged in)
        alias_action :create, :read, :update, :destroy, :to => :crud

        if user.profile_type=="CompanyProfile"
            can [:read, :create], [Vacancy, CompanyProfile]
         
            can [:update,:delete], Vacancy do |vacancy|
                vacancy.try(:company_profile).try(:user) ==user       
            end 

            can :update, Application do |application|
                application.try(:vacancy).try(:company_profile) ==user.company_profile       
            end 

             can [:update,:delete], CompanyProfile do |company_profile|
                company_profile.try(:user) ==user       
            end 

            can :read, UserProfile

        elsif user.profile_type=='UserProfile'
            can :read, [ CompanyProfile, Vacancy, UserProfile]
            can :create, Application
            can :show_cv, [UserProfile]
            can :update, UserProfile do |user_profile|
                user_profile.try(:user) ==user       
            end 
            
        end
        can :read , Vacancy
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
