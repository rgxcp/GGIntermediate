# BAD
# save user with auto generated password if user does not give password on registration.
# default role is temp
# return error if user email/username/phone is empty.
def reg_usr(params)
  a = Data.new(params)
  a.role = "admin"
  if a.password.blank?
  a.gen_pass
  end
  raise Error::InvalidUserError if a.email.blank?||a.username.blank?||a.phone.blank?||!(a.email.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i))||!(a.phone.match(/\A\+?[\d\s\-\.\(\)]+\z/))
  raise Error::DuplicateUser if Data.query("select count(1) from users where phone=#{a.phone} or email=#{a.email}") > 0
  a.save
  a.sendmailcnfrm
  a
end

# GOOD
def register_user(params)
  user = Data.new(params)
  user.role = "admin"
  user.generate_password if user.password.blank?

  raise Error::InvalidUserError if invalid_user?
  raise Error::DuplicateUser if duplicated_user?

  user.save
  user.send_email_confirmation
  user
end

def invalid_user?(user)
  user.email.blank? \
    || user.username.blank? \
    || user.phone.blank? \
    || !(user.email.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)) \
    || !(user.phone.match(/\A\+?[\d\s\-\.\(\)]+\z/))
end

def duplicated_user?(user)
  Data.query("SELECT COUNT(1) FROM users WHERE phone = #{user.phone} OR email = #{user.email}") > 0
end
