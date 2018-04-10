require './lib/bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      Bookmark.create(url: "http://makersacademy.com")

      expected_bookmarks = [
        'http://makersacademy.com'
      ]
      bookmarks = Bookmark.all
      expect(bookmarks).to eq expected_bookmarks
    end
  end
  describe '.create' do
    it 'creats a new bookmark' do
      Bookmark.create(url: 'https://github.com/MaryDomashneva')
      expect(Bookmark.all).to include 'https://github.com/MaryDomashneva'
    end
  end
end
