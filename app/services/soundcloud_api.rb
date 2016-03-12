class SoundcloudApi
  def self.search(query)
      json_response_for(query).map do |track|
      {
        title: track['title'],
        provider: 'soundcloud',
        provider_track_id: track['id'],
        duration: track['duration'],
        artist: track['user']['username'],
        picture_url: track['artwork_url']
      }
    end
  end

  private

  def self.json_response_for(query)
    client = Soundcloud.new(client_id: ENV.fetch('SOUNDCLOUD_CLIENT_ID'))
    client.get('/tracks', q: query)
  end
end
