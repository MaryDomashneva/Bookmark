require './lib/bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      new_url = { url: 'http://makersacademy.com' }
      new_title = { title: 'Makersacademy' }
      Bookmark.create(new_url, new_title)

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
      new_url = { url: 'https://github.com/MaryDomashneva' }
      new_title = { title: 'GitHub' }
      Bookmark.create(new_url, new_title)
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
      new_url = { url: link }
      new_title = { title: 'GitHub' }
      Bookmark.create(new_url, new_title)
      expect(Bookmark.unique?(link)).to eq(false)
    end
    it 'returns true if URL is unique' do
      Bookmark.all
      expect(Bookmark.unique?('https://stackoverflow.com')).to eq(true)
    end
  end
end
