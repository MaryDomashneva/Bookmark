require 'pry'

def create_date_base
  Bookmark.create(
    url: 'http://makersacademy.com',
    title: 'Makersacademy'
  )
end

def create_database_with_several_bookmarks
  Bookmark.create(
    url: 'http://makersacademy.com',
    title: 'Makersacademy'
  )
  Bookmark.create(
    url: 'https://travis-ci.org',
    title: 'Travis'
  )
end


def create_database_with_several_bookmarks_for_feature_test
  visit('/bookmarks')
  click_button('Add_new_bookmark')
  fill_in('url', with: 'https://travis-ci.org')
  fill_in('title', with: 'Travis')
  click_button('Submit')
  click_button('Add_new_bookmark')
  fill_in('url', with: 'https://vk.com')
  fill_in('title', with: 'Vkontakt')
  click_button('Submit')
end
