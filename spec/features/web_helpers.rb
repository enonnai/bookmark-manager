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
