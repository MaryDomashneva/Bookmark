feature 'View bookmarks' do
  scenario 'A user can see bookmarks' do
    Bookmark.create(url: "http://makersacademy.com")

    visit('/bookmarks')
    expect(page).to have_content "http://makersacademy.com"
  end
end
