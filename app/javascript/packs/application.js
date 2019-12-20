import "bootstrap";
import React from 'react';
import ReactDOM from 'react-dom';
import Chat from '../src/containers/Chat';


document.addEventListener('DOMContentLoaded', () => {
  const element = document.getElementById('chat_react');
  if (element) {
    const props = {
      channels: JSON.parse(element.dataset.channels),
      team: JSON.parse(element.dataset.team),
      messages: JSON.parse(element.dataset.messages),
      channel: JSON.parse(element.dataset.channel),
      user: JSON.parse(element.dataset.user)
    };

    ReactDOM.render(
      <Chat {...props} />,
      document.body.appendChild(document.createElement('div')),
    )
  }
})
