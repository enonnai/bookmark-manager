feature 'Creating tags' do

  scenario 'Can add tags to a link' do
    visit '/links/new'
    add_new_link
    fill_in 'tags', with: 'search_engine'
    click_button 'Save'
    within 'ul#links' do
      expect(page).to have_content 'search_engine'
    end
  end
end
