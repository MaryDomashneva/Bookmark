feature 'View bookmarks' do
  scenario 'A user can see bookmarks' do
    Bookmark.create(
      url: 'http://makersacademy.com',
      title: 'Makersacademy'
    )
    visit('/bookmarks')
    expect(find_link('Makersacademy').visible?).to be(true)
  end
end
