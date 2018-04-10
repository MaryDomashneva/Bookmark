require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://makersacademy.com');")

      expected_bookmarks = [
        'http://makersacademy.com'
      ]
      bookmarks = Bookmark.all
      expect(bookmarks).to eq expected_bookmarks
    end
  end
end
