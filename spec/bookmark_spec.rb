require './lib/bookmark'

describe Bookmark do

  link = 'http://makersacademy.com'

  expected_bookmarks = [
    {
      'url' => link,
      'title' => 'Makersacademy',
      'id' => '1'
    }
  ]

  describe '.all' do
    it 'returns all bookmarks' do
      create_date_base
      bookmarks = Bookmark.all
      expect(bookmarks).to eq expected_bookmarks
    end
  end
  describe '.create' do
    it 'creats a new bookmark' do
      create_date_base
      expect(Bookmark.all.last['url']).to eq(link)
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
      create_date_base
      expect(Bookmark.unique?(link)).to eq(false)
    end
    it 'returns true if URL is unique' do
      create_date_base
      expect(Bookmark.unique?('https://travis-ci.org')).to eq(true)
    end
  end
  describe '.delete_bookmarks' do
    it 'delets bookmark by url and returns database without deleted bookmark' do
      create_database_with_several_bookmarks
      Bookmark.delete_bookmarks(['https://travis-ci.org'])
      bookmarks = Bookmark.all
      expect(bookmarks).to eq expected_bookmarks
    end
  end
end
