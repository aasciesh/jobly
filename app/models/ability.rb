class Ability
    include CanCan::Ability
    include SessionHelper
    def initialize(user)
        user ||=  User.new # guest user (not logged in)
        alias_action :create, :read, :update, :destroy, :to => :crud

        if user.profile_type=="CompanyProfile"
            can :create, Vacancy
            can :read, [Application, CompanyProfile, Experience, LanguageSkill, Qualification, Reference, UserProfile, Vacancy ]


            can :update, Application do |application|
                application.try(:vacancy).try(:company_profile) ==user.profile  
            end 

            can [:update,:destroy], CompanyProfile do |company_profile|
                company_profile.try(:user) ==user       
            end
            
            can [:update,:destroy], Vacancy do |vacancy|
                vacancy.try(:company_profile).try(:user) ==user       
            end 

            
            can [:read, :update,:destroy], User do |owner|
                owner ==user       
            end
             

            can [:read, :show_cv], UserProfile

        elsif user.profile_type=='UserProfile'

            can :create, [Application, Experience, LanguageSkill, Qualification, Reference]
            can :read, [ Application, CompanyProfile, Experience, LanguageSkill, Qualification,Reference, Vacancy]            
           
            can [:update, :destroy], [ Experience, LanguageSkill, Qualification, Reference ] do |item|
                item.try(:user_profile) ==user.profile       
            end 

            can [:show_cv, :update, :destroy], UserProfile do |user_profile|
                user_profile.try(:user) ==user       
            end 

            can [:read, :update,:destroy], User do |owner|
                owner ==user       
            end

        end
        can :read , [Vacancy, CompanyProfile, UserProfile]
        can :create, [CompanyProfile, UserProfile] if user.profile.nil?
    
=begin

        C=Create        R= Read        U=Update        (crud)= only if user owns        D= Destroy        
        ---------------------------------------------------------------------------------------------

                                        guest       Job seeker           Company
                                ---------------------------------------------------
        Application             |       --      |       CR          |       R(u)

        Category            
        
        company_profile         |       CR      |       R           |       R(ud)
        
        Experience              |       --      |       CR(ud)      |       R
        
        LanguageSkill           |       --      |       CR(ud)      |       R       
        
        Qualification           |       --      |       CR(ud)      |       R
        
        Reference               |       --      |       CR(ud)      |       R
        
        TagMatch            
        
        Tag         
        
        UserProfile             |       CR      |       (rud)       |       R
        
        Vacancy                 |       R       |       R           |       CR(ud)       
        
        User                    |       --      |       (rud)       |       (rud)     

=end


    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
