feature 'View bookmarks' do
  scenario 'A user can see bookmarks' do
    new_url = { url: 'http://makersacademy.com' }
    new_title = { title: 'Makersacademy' }
    Bookmark.create(new_url, new_title)

    visit('/bookmarks')
    expect(page).to have_content "http://makersacademy.com"
    expect(page).to have_content "Makersacademy"
  end
end
