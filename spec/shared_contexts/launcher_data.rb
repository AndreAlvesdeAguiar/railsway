shared_context 'launcher_data' do
  let(:launcher_data) do
    {
        "id": "e3df2ecd-c239-472f-95e4-2b89b4f75800",
        "url": "https://ll.thespacedevs.com/2.0.0/launch/e3df2ecd-c239-472f-95e4-2b89b4f75800/",
        "launch_library_id": nil,
        "slug": "sputnik-8k74ps-sputnik-1",
        "name": "Sputnik 8K74PS | Sputnik 1",
        "status": {
            "id": 3,
            "name": "Success"
        },
        "net": "1957-10-04T19:28:34Z",
        "window_end": "1957-10-04T19:28:34Z",
        "window_start": "1957-10-04T19:28:34Z",
        "inhold": false,
        "tbdtime": false,
        "tbddate": false,
        "probability": nil,
        "holdreason": nil,
        "failreason": nil,
        "hashtag": nil,
        "launch_service_provider": {
            "id": 66,
            "url": "https://ll.thespacedevs.com/2.0.0/agencies/66/",
            "name": "Soviet Space Program",
            "type": "Government"
        },
        "rocket": {
            "id": 3003,
            "configuration": {
                "id": 468,
                "launch_library_id": nil,
                "url": "https://ll.thespacedevs.com/2.0.0/config/launcher/468/",
                "name": "Sputnik 8K74PS",
                "family": "Sputnik",
                "full_name": "Sputnik 8K74PS",
                "variant": "8K74PS"
            }
        },
        "mission": {
            "id": 1430,
            "launch_library_id": nil,
            "name": "Sputnik 1",
            "description": "First artificial satellite consisting of a 58 cm pressurized aluminium shell containing two 1 W transmitters for a total mass of 83.6 kg.",
            "launch_designator": nil,
            "type": "Test Flight",
            "orbit": {
                "id": 8,
                "name": "Low Earth Orbit",
                "abbrev": "LEO"
            }
        },
        "pad": {
            "id": 32,
            "url": "https://ll.thespacedevs.com/2.0.0/pad/32/",
            "agency_id": nil,
            "name": "1/5",
            "info_url": nil,
            "wiki_url": "",
            "map_url": "https://www.google.com/maps/place/45Â°55'12.0\"N+63Â°20'31.2\"E",
            "latitude": "45.92",
            "longitude": "63.342",
            "location": {
                "id": 15,
                "url": "https://ll.thespacedevs.com/2.0.0/location/15/",
                "name": "Baikonur Cosmodrome, Republic of Kazakhstan",
                "country_code": "KAZ",
                "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_15_20200803142517.jpg",
                "total_launch_count": 1536,
                "total_landing_count": 0
            },
            "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_32_20200803143513.jpg",
            "total_launch_count": 487
        },
        "webcast_live": false,
        "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/sputnik_8k74ps_image_20210830185541.jpg",
        "infographic": nil,
        "program": []
      }.deep_stringify_keys!
  end

  let(:update_launcher_data) do
    {
        "id": "e3df2ecd-c239-472f-95e4-2b89b4f75800",
        "url": "https://ll.thespacedevs.com/2.0.0/launch/e3df2ecd-c239-472f-95e4-2b89b4f75800/",
        "launch_library_id": nil,
        "slug": "sputnik-8k74ps-sputnik-1",
        "name": "Update Sputnik 8K74PS | Sputnik 1",
        "status": {
            "id": 3,
            "name": "Success"
        },
        "net": "1957-10-04T19:28:34Z",
        "window_end": "1957-10-04T19:28:34Z",
        "window_start": "1957-10-04T19:28:34Z",
        "inhold": false,
        "tbdtime": false,
        "tbddate": false,
        "probability": nil,
        "holdreason": nil,
        "failreason": nil,
        "hashtag": nil,
        "launch_service_provider": {
            "id": 66,
            "url": "https://ll.thespacedevs.com/2.0.0/agencies/66/",
            "name": "Soviet Space Program",
            "type": "Government"
        },
        "rocket": {
            "id": 3003,
            "configuration": {
                "id": 468,
                "launch_library_id": nil,
                "url": "https://ll.thespacedevs.com/2.0.0/config/launcher/468/",
                "name": "Sputnik 8K74PS",
                "family": "Sputnik",
                "full_name": "Sputnik 8K74PS",
                "variant": "8K74PS"
            }
        },
        "mission": {
            "id": 1430,
            "launch_library_id": nil,
            "name": "Sputnik 1",
            "description": "First artificial satellite consisting of a 58 cm pressurized aluminium shell containing two 1 W transmitters for a total mass of 83.6 kg.",
            "launch_designator": nil,
            "type": "Test Flight",
            "orbit": {
                "id": 8,
                "name": "Low Earth Orbit",
                "abbrev": "LEO"
            }
        },
        "pad": {
            "id": 32,
            "url": "https://ll.thespacedevs.com/2.0.0/pad/32/",
            "agency_id": nil,
            "name": "1/5",
            "info_url": nil,
            "wiki_url": "",
            "map_url": "https://www.google.com/maps/place/45Â°55'12.0\"N+63Â°20'31.2\"E",
            "latitude": "45.92",
            "longitude": "63.342",
            "location": {
                "id": 15,
                "url": "https://ll.thespacedevs.com/2.0.0/location/15/",
                "name": "Baikonur Cosmodrome, Republic of Kazakhstan",
                "country_code": "KAZ",
                "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_15_20200803142517.jpg",
                "total_launch_count": 1536,
                "total_landing_count": 0
            },
            "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_32_20200803143513.jpg",
            "total_launch_count": 487
        },
        "webcast_live": false,
        "image": "No image detected in update",
        "infographic": nil,
        "program": []
      }.deep_stringify_keys!
  end

  def symbolized_attributes
    [
      :url,
      :launch_library_id,
      :slug,
      :name,
      :net,
      :window_end,
      :window_start,
      :inhold,
      :tbdtime,
      :tbddate,
      :probability,
      :holdreason,
      :failreason,
      :hashtag,
      :webcast_live,
      :image,
      :infographic,
      :imported_t,
      :import_status,
      :launch_service_provider,
      :mission,
      :pad,
      :program,
      :rocket,
      :status
    ]
  end
end
