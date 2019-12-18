import React from 'react';
import ChatNav from '../components/ChatNav';

class Chat extends React.Component {
  render() {
    const team = this.props.team;
    const generalLinks = [
      { id: 'new_channel', name: 'New Channel', href: `/teams/${team.name.toLowerCase()}/channel/new` },
      { id: 'discover', name: 'Discover', href: `/teams/${team.name.toLowerCase()}/channels` }
    ];

    return (
      <div className="row">
        <div className="col-md-2">
          <ChatNav links={this.props.channels} />
          <hr className="my-3" />
          <ChatNav links={generalLinks} />
        </div>
      </div>
    )
  }
}

export default Chat;
