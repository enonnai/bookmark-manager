feature 'Viewing links' do

  scenario 'Can see a list of links on the links page' do

    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

    visit '/links/index'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
