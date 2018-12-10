module CurrentUserConcern

  def current_user
    super || guest_user
  end

  def guest_user
    OpenStruct.new(name:'Guest user',
                  first_name: 'Guest', 
                  last_name: 'user')
  end
end