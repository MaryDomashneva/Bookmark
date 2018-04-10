feature 'Add a new bookmarks' do
  scenario 'A user can save a page and add a new bookmark' do
    visit('/bookmarks/new')
    fill_in('url', with: 'https://github.com/MaryDomashneva')
    click_button('Submit')
    expect(page).to have_content "https://github.com/MaryDomashneva"
  end
end
