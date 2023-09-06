class ItunesSearchService
  BASE_URL = 'https://itunes.apple.com/search'

  def call(query)
    search(query)
  end

  protected

  def search(query)
    uri = URI(BASE_URL)
    uri.query = URI.encode_www_form({ term: query, entity: 'album', limit: 25 })

    response = Net::HTTP.get(uri)
    json_response = JSON.parse(response)

    albums = json_response['results'].map do |result|
      {
        artworkUrl100: result['artworkUrl100'],
        collectionName: result['collectionName'],
        artistName: result['artistName'],
        collectionId: result['collectionId']
      }
    end

    albums
  end
end
