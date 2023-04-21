module ApiAsJsonHelper
  def launch_as_json(launch)
    {
      'id' => launch.id,
      'url' => launch.url,
      'launch_library_id' => launch.launch_library_id,
      'slug' => launch.slug,
      'name' => launch.name,
      'net' => launch.net,
      'window_end' => launch.window_end,
      'window_start' => launch.window_start,
      'inhold' => launch.inhold,
      'tbdtime' => launch.tbdtime,
      'tbddate' => launch.tbddate,
      'probability' => launch.probability,
      'holdreason' => launch.holdreason,
      'failreason' => launch.failreason,
      'hashtag' => launch.hashtag,
      'webcast_live' => launch.webcast_live,
      'image' => launch.image,
      'infographic' => launch.infographic,
      'imported_t' => launch.imported_t.strftime('%Y-%m-%d'),
      'import_status' => launch.import_status,
      'import_id' => launch.import_id,
      'last_import_code' => launch.last_import_code,
      'launch_service_provider' => launch.launch_service_provider,
      'mission' => launch.mission,
      'pad' => launch.pad,
      'program' => launch.program,
      'rocket' => launch.rocket,
      'status' => launch.status,
      'created_at' => launch.created_at.strftime('%FT%T.%3NZ'),
      'updated_at' => launch.updated_at.strftime('%FT%T.%3NZ')
    }
  end

  def token_as_json(token)
    {
      'token' => token.key,
      'expiration' => token.expiration.strftime("%d/%m/%Y - %H:%M:%S")
    }
  end
end

