feature 'Create links' do
  scenario 'User can add sites address and title to bookmark manager' do
    visit '/links/new'
    add_new_link
    click_button 'Save'
    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content 'Google'
    end
  end
end
