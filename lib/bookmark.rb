require 'pg'
require 'uri'

class Bookmark

  attr_reader :result

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    @result = connection.exec("SELECT * FROM bookmarks")
    @result.map { |bookmark| bookmark['url'] }
  end

  def self.create(options)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    #
    # return false unless is_url?(options[:url])

    connection.exec("INSERT INTO bookmarks (url) VALUES('#{options[:url]}')")
  end

  def self.unique?(url)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    @result = connection.exec("SELECT * FROM bookmarks WHERE url LIKE '#{url}';")
    @result.to_a.length == 0
  end

  def self.is_url?(url)
    uri = URI.parse(url)
    uri.kind_of?(URI::HTTP) && uri.kind_of?(URI::HTTPS)
  end
end
