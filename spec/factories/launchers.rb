FactoryBot.define do
  factory :launch do
    url { 'www.url.com' }
    launch_library_id { '12345' }
    slug { 'Launcher slug' }
    name { 'Launcher name' }
    net { '1957-10-04T19:28:34Z '}
    window_end { "1957-10-04T19:28:34Z" }
    window_start { "1957-10-04T19:28:34Z" }
    inhold { false }
    tbdtime { false }
    tbddate { false }
    probability { nil }
    holdreason { nil }
    failreason { nil  }
    hashtag { nil }
    webcast_live { false }
    image { 'www.image_url.com'  }
    infographic { nil }
  end
end
