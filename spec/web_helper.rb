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
