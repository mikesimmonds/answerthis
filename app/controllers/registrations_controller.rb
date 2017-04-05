class RegistrationsController < Devise::RegistrationsController

  def create
    super do
      Profile.create(user_id: resource.id)
    end
  end

  protected

  def after_sign_up_path_for(resource)
    edit_profile_path(resource.profile.id)
  end

end

  ##This controller inherits from the Devise controller (which is hidden for security reasons)

  ##Thia controller overwrites the default methods for #create and #after_sign_up_path_for

  ##the create method takes everything the original create method did (SUPER) and also creates a user account (a  bit like when you create a new object before creating a form)

  ##The after_sign_up_path_for method reditectds the user to the newly created account to the edit_user_path which allows them to fill in the details.