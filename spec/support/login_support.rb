module LoginSupport
  def sign_in_as(user)
    visit new_sessions_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Create Sign in'
  end
end
