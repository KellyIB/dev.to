require "rails_helper"

RSpec.describe YouTubeService, type: :service do
  it "will return three youtube responses" do
    tag_list = %w[ruby coding testing]
    response = described_class.retrieve_videos(tag_list)
    expect(response[:items].length).to eq(3)
    expect(response[:items][0]).to have_key(:id)
    expect(response[:items][1]).to have_key(:id)
    expect(response[:items][2]).to have_key(:id)
  end

  it "can be called through class method" do
    tag_list = %w[ruby coding testing]
    response = described_class.video_info(tag_list)
    expect(response.length).to eq(3)
    expect(response.values[0]).to have_key(:url)
    expect(response.values[0]).to have_key(:title)
    expect(response.values[0]).to have_key(:description)
    expect(response.values[0]).to have_key(:thumbnail)
    expect(response.values[0]).to have_key(:thumbnail_width)
    expect(response.values[0]).to have_key(:thumbnail_height)
  end
end
