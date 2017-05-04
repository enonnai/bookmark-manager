feature 'Tags' do

  context 'when a website title and URL is added' do

    before do
      Link.create(url: "www.google.com", title: "Google", tags: [Tag.first_or_create(tag: "search")])
    end

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

  context 'when a tag is added' do

      before do
      Link.create(url: "www.google.com", title: "Google", tags: [Tag.first_or_create(tag: "search")])
    end

    scenario 'Can view tags' do
      visit '/links/new'
      fill_in('title', with: 'Blow Soap Bubbles')
      fill_in('url', with: 'www.bubbles.com')
      fill_in 'tags', with: 'bubbles'
      click_button 'Save'
      visit '/tag/bubbles'
      expect(page).to have_content 'Blow Soap Bubbles'
      expect(page).not_to have_content "Google"
    end
  end

  context 'when multiple tags are added' do

      scenario 'Can add multiple tags' do
      visit '/links/new'
      fill_in('title', with: 'Makers')
      fill_in('url', with: 'www.makersacademy.com')
      fill_in('tags', with: 'education ruby')
      click_button 'Save'
      link = Link.first
      expect(link.tags.map(&:tag)).to include('education', 'ruby')
    end
  end
end
