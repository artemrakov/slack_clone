import React from 'react';
import axios from 'axios';
import ChatNav from '../components/ChatNav';
import Messages from '../components/Messages';
import NewMessage from './NewMessage';
import { HEADERS } from '../constants';

class Chat extends React.Component {
  state = {
    messages: [],
    channels: [],
    channel: {},
    team: {},
    generalLinks: [],
    subscription: {},
    user: {}
  }

  componentDidMount() {
    const { messages, channels, channel, team, user } = this.props;
    const generalLinks = [
      { id: 'new_channel', name: 'New Channel', href: `/teams/${team.name.toLowerCase()}/channels/new` },
      { id: 'discover', name: 'Discover', href: `/teams/${team.name.toLowerCase()}/channels` }
    ];

    const subscription = App.cable.subscriptions.create({ channel: "Team::Channel::MessagesChannel", team_channel: channel.id }, { received: this.handlerActionCableRequest } );
    this.setState({ messages, channels, channel, team, generalLinks, subscription, user });
  }

  handlerActionCableRequest = (request) => {
    switch (request.type) {
      case("ADD_MESSAGE"):
        this.addMessageToState(request.data);
        break;
      case("DELETE_MESSAGE"):
        this.removeMessageFromState(request.data)
        break;
    }
  }

  addMessageToState = (message) => {
    this.setState({ messages: [...this.state.messages, message] });
  }

  removeMessageFromState = (id) => {
    const newMessages = this.state.messages.filter(message => message.id !== id);

    this.setState({ messages: newMessages });
  }

  deleteMessage = (id) => async (event) => {
    event.preventDefault();
    await axios.delete(`/channels/${this.state.channel.id}/messages/${id}`)
  }

  handleChangeChannel = (id) => async (event) => {
    event.preventDefault();
    this.state.subscription.unsubscribe();

    const response = await axios.get(`/teams/${this.state.team.name.toLowerCase()}/channels/${id}`, { headers: HEADERS })
    const { messages, channels, channel, team } = response.data;
    const subscription = App.cable.subscriptions.create({ channel: "Team::Channel::MessagesChannel", team_channel: channel.id }, { received: this.handlerActionCableRequest } );

    this.setState({ messages, channels, channel, team, subscription });
  }

  render() {
    return (
      <div className="container">
        <div className="row">
          <div className="col-md-2">
            <ChatNav channel={this.state.channel} click={this.handleChangeChannel} links={this.state.channels} />
            <hr className="my-3" />
            <ChatNav channel={this.state.channel} links={this.state.generalLinks} />
          </div>
          <div className="col-md-8">
            <Messages messages={this.state.messages} delete={this.deleteMessage} />
            <NewMessage user={this.state.user.guest} channel={this.state.channel} />
          </div>
        </div>
      </div>
    )
  }
} 
export default Chat;
