import { h, render } from 'preact';
import { RelatedVideos } from '../relatedVideos/RelatedVideos';

function loadVideos() {
  const root = document.getElementById('videos-container');
  render(
    <RelatedVideos videos={root.dataset.videos} />,
    root,
    root.firstElementChild,
  );
}

document.ready.then(() => {
  loadVideos();
  window.InstantClick.on('change', () => {
    if (document.getElementById('videos-container')) {
      loadVideos();
    }
  });
});
