feature 'View bookmarks' do
  scenario 'A user can see bookmarks' do
  create_date_base
    visit('/bookmarks')
    expect(find_link('Makersacademy').visible?).to be(true)
  end
end
