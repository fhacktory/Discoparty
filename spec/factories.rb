FactoryGirl.define do
  factory :track do
    sequence(:title) { |n| "Title #{n}" }
    sequence(:artist) { |n| "Artist #{n}" }
    provider 'deezer'
    provider_track_id '1234'
    playlist
  end

  factory :playlist do
    sequence(:name) { |n| "Name #{n}" }
  end

  factory :love, class: 'Vote' do
    vote_type 'love'
    user
    track
  end

  factory :hate, class: 'Vote' do
    vote_type 'hate'
    user
    track
  end

  factory :user do
    name ''
  end
end
