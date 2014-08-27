json.array!(@videos) do |video|
  json.extract! video, :id, :name, :url, :user_id
  json.url video_url(video, format: :json)
end
