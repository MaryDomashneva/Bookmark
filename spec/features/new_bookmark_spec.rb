require 'pry'

feature 'Add a new bookmark' do
  scenario 'A user can save a page and add a new bookmark' do
    visit('/bookmarks/new')
    fill_in('url', with: 'https://travis-ci.org')
    fill_in('title', with: 'Travis')
    click_button('Submit')
    expect(page).to have_content "https://travis-ci.org"
    expect(page).to have_content "Travis"
  end

  scenario 'The bookmark must be a valid URL' do
    visit('/bookmarks/new')
    fill_in('url', with: 'htps://travis-ci.org')
    click_button('Submit')
    expect(page).not_to have_content "htps://travis-ci.org"
    expect(page).to have_content "You must submit a valid URL."
  end
end
