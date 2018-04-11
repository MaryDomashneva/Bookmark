require './lib/bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      Bookmark.create(
        url: 'http://makersacademy.com',
        title: 'Makersacademy'
      )

      expected_bookmarks = [
        {
          'url' => 'http://makersacademy.com',
          'title' => 'Makersacademy',
          'id' => '1'
        }
      ]
      bookmarks = Bookmark.all
      expect(bookmarks).to eq expected_bookmarks
    end
  end
  describe '.create' do
    it 'creats a new bookmark' do
      Bookmark.create(
        url: 'https://github.com/MaryDomashneva',
        title: 'GitHub'
      )
      expect(Bookmark.all.last['url']).to eq('https://github.com/MaryDomashneva')
    end
  end
  describe '.is_url?' do
    it 'returns false if URL is not valid' do
      expect(Bookmark.is_url?('htps://travis-ci.org')).to eq(false)
    end
    it 'returns true if URL is valid' do
      expect(Bookmark.is_url?('https://travis-ci.org')).to eq(true)
    end
  end
  describe '.unique?' do
    it 'returns false if URL is not unique' do
      link = 'https://github.com/MaryDomashneva'
      Bookmark.create(
        url: link,
        title: 'GitHub'
      )
      expect(Bookmark.unique?(link)).to eq(false)
    end
    it 'returns true if URL is unique' do
      Bookmark.create(
        url: 'https://github.com/MaryDomashneva',
        title: 'GitHub'
      )
      expect(Bookmark.unique?('https://stackoverflow.com')).to eq(true)
    end
  end
end
