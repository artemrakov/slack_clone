import "bootstrap";
import React from 'react';
import ReactDOM from 'react-dom';
import Chat from '../containers/Chat';

document.addEventListener('DOMContentLoaded', () => {
  const element = document.getElementById('chat_react');
  if (element) {
    const props = {
      channels: JSON.parse(element.dataset.channels),
      team: JSON.parse(element.dataset.team)
    };

    ReactDOM.render(
      <Chat {...props} />,
      document.body.appendChild(document.createElement('div')),
    )
  }
})
