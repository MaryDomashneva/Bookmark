

feature 'View links' do
  scenario 'when pressing the button Bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content "http://makersacademy.com"
  end
end
