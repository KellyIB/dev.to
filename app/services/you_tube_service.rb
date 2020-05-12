class YouTubeService
  include HTTParty

  base_uri "https://www.googleapis.com"

  def self.retrieve_videos(tags)
    response = get("/youtube/v3/search?part=snippet&order=viewCount&maxResults=3&q=#{tags.join(', ')}&type=video&key=#{ENV['YOUTUBE_API_KEY']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.video_info(tags)
    retrieve_videos(tags)[:items].each_with_object({}) do |video, acc|
      acc[video[:id][:videoId]] = { url: "www.youtube.com/watch?v=#{video[:id][:videoId]}",
                                    title: video[:snippet][:title],
                                    description: video[:snippet][:description],
                                    thumbnail: video[:snippet][:thumbnails][:default][:url],
                                    thumbnail_width: video[:snippet][:thumbnails][:default][:width],
                                    thumbnail_height: video[:snippet][:thumbnails][:default][:height] }
    end
  end
end
