import { h } from 'preact';
import PropTypes from 'prop-types';
import { VideoPlayer } from './components/videoPlayer';

export const RelatedVideos = ({ videos }) => (
  <div>
    <h1>Related Videos</h1>
    <div className="related-videos">
      {JSON.parse(videos).map(video => (
        <VideoPlayer videoId={video} />
      ))}
    </div>
  </div>
);

RelatedVideos.propTypes = {
  videos: PropTypes.string.isRequired,
};
