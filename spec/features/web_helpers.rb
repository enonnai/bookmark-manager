def add_new_link
  fill_in('title', with: 'Google')
  fill_in('url', with: 'http://www.google.co.uk')
end

def sign_up
  visit 'users/new'
  expect(page.status_code).to eq 200
  fill_in :email, with: 'ken@streetfighter.com'
  fill_in :password, with: 'iamthebestfighter'
  click_button 'Sign up'
end

def sign_up(email: 'ken@streetfighter.com',
            password: '12345678',
            password_confirmation: '12345678')
  visit '/users/new'
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end
