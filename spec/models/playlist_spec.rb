require 'rails_helper'

describe Playlist do
  it { should have_many(:tracks) }

  it { should validate_presence_of(:name) }

  describe '#current_track' do
    it 'returns and array containing the current playing track' do
      playlist = create(:playlist)
      current_playing_track = create(:track, playing: true, played: false, playlist: playlist)
      create(:track, playing: false, played: false, playlist: playlist)
      create(:track, playing: false, played: true, playlist: playlist)

      expect(playlist.current_track).to eq([current_playing_track])
    end
  end

  describe '#next_tracks_ordered' do
    it 'returns next coming tracks' do
      playlist = create(:playlist)
      create(:track, playing: false, played: false, playlist: playlist)
      create(:track, playing: false, played: true, playlist: playlist)
      create(:track, playing: true, played: false, playlist: playlist)

      expect(playlist.next_tracks_ordered.count).to eq(1)
    end

    it 'sorts track by score' do
      playlist = create(:playlist)
      first = create(:track, playlist: playlist)
      second = create(:track, playlist: playlist)
      third = create(:track, playlist: playlist)
      create_list(:love, 3, track: first)
      create_list(:hate, 3, track: third)

      expect(playlist.next_tracks_ordered).to eq([first, second, third])
    end
  end
end
