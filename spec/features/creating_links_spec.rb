feature 'Create links' do
  scenario 'User can add sites address and title to bookmark manager' do
    visit '/links/new'
    fill_in('title', with: 'Google')
    fill_in('url', with: 'http://www.google.co.uk')
    click_button 'Save'
    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content 'Google'
    end
  end
end
