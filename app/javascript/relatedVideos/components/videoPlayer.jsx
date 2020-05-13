import { h } from 'preact';
import PropTypes from 'prop-types';

export const VideoPlayer = ({ videoId }) => (
  <iframe
    title={`youtube/${  videoId}`}
    src={`https://www.youtube.com/embed/${  videoId}`}
    frameBorder="0"
    allowFullScreen
  />
);

VideoPlayer.propTypes = {
  videoId: PropTypes.string.isRequired,
};
