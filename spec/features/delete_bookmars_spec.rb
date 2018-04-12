require 'pry'

feature 'Delete existing bookmarks' do
  scenario 'A user can press button Delete and choose form check-boxes
  which bookmarks user whants to delete' do
    visit('/bookmarks')
    click_button('Add_new_bookmark')
    fill_in('url', with: 'https://travis-ci.org')
    fill_in('title', with: 'Travis')
    click_button('Submit')
    p Bookmark.all.to_a
    click_button('Add_new_bookmark')
    fill_in('url', with: 'https://vk.com')
    fill_in('title', with: 'Vkontakt')
    click_button('Submit')
    p Bookmark.all.to_a
    click_button('Delete')
    uncheck(2)
    click_button('Submit')
    save_and_open_page
    expect(find_link('Travis').visible?).to be(false)
  end
end
