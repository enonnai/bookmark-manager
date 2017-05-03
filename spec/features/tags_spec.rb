feature 'Tags' do

  scenario 'Can add tags to a link' do
    visit '/links/new'
    add_new_link
    fill_in 'tags', with: 'search_engine'
    click_button 'Save'
    within 'ul#links' do
      expect(page).to have_content 'search_engine'
    end
  end

  scenario 'Can view tags' do
    visit '/links/new'
    fill_in('title', with: 'Blow Soap Bubbles')
    fill_in('url', with: 'http://www.popsci.com/how-to-freeze-soap-bubbles-into-ice-orbs')
    fill_in 'tags', with: 'bubbles'
    click_button 'Save'
    visit '/tags/bubbles'
    expect(page).to have_content 'Blow Soap Bubbles'
  end
end
