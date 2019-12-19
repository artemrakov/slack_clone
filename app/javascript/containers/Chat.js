import React from 'react';
import axios from 'axios';
import ChatNav from '../components/ChatNav';
import Messages from '../components/Messages';
import NewMessage from './NewMessage';

class Chat extends React.Component {
  state = {
    messages: [],
    channels: [],
    channel: {},
    team: {},
    generalLinks: []
  }

  componentDidMount() {
    const { messages, channels, channel, team } = this.props;
    const generalLinks = [
      { id: 'new_channel', name: 'New Channel', href: `/teams/${team.name.toLowerCase()}/channel/new` },
      { id: 'discover', name: 'Discover', href: `/teams/${team.name.toLowerCase()}/channels` }
    ];
    this.setState({ messages, channels, channel, team, generalLinks });
  }

  addMessage = async (attributes) => {
    const response = await axios.post(`/channels/${this.state.channel.id}/messages`, {
      team_channel_message: attributes
    })


    this.setState({ messages: [...this.state.messages, response.data] });
  }

  deleteMessage = (id) => async (event) => {
    event.preventDefault();
    const response = await axios.delete(`/channels/${this.state.channel.id}/messages/${id}`)
    const newMessages = this.state.messages.filter(message => message.id !== id);

    this.setState({ messages: newMessages });
  }


  render() {
    return (
      <div className="container">
        <div className="row">
          <div className="col-md-2">
            <ChatNav links={this.state.channels} />
            <hr className="my-3" />
            <ChatNav links={this.state.generalLinks} />
          </div>
          <div className="col-md-8">
            <Messages messages={this.state.messages} delete={this.deleteMessage} />
            <NewMessage action={this.addMessage} channel={this.state.channel} />
          </div>
        </div>
      </div>
    )
  }
}

export default Chat;
