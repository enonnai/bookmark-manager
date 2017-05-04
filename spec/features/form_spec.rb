feature 'User sign up form' do
  scenario 'Signs up a user' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content 'Welcome, ken@streetfighter.com'
    expect(User.first.email).to eq 'ken@streetfighter.com'
  end
end
