require 'rails_helper'

describe Track do
  it { should belong_to(:playlist) }
  it { should have_many(:loves).class_name('Vote') }
  it { should have_many(:hates).class_name('Vote') }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:artist) }
  it { should validate_presence_of(:provider) }
  it { should validate_presence_of(:provider_track_id) }
  it { should validate_presence_of(:playlist) }

  describe '.not_played' do
    it 'returns only not played tracks' do
      playlist = create(:playlist)
      create(:track, played: false, playlist: playlist)
      create(:track, played: true, playlist: playlist)

      expect(Track.not_played.count).to eq(1)
    end
  end

  describe '#score' do
    it 'returns track score' do
      track = create(:track)
      create_list(:love, 2, track: track)
      create_list(:hate, 3, track: track)

      expect(track.score).to eq(-1)
    end
  end

  describe '#love_for' do
    it 'returns vote instance that corresponds to user' do
      user = create(:user)
      track = create(:track)
      love = create(:love, track: track, user: user)

      expect(track.love_for(user).first).to eq(love)
    end
  end

  describe '#hate_for' do
    it 'returns vote instance that corresponds to user' do
      user = create(:user)
      track = create(:track)
      love = create(:hate, track: track, user: user)

      expect(track.hate_for(user).first).to eq(love)
    end
  end
end
