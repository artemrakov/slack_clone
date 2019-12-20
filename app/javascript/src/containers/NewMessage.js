import React from 'react';
import axios from 'axios';

class NewMessage extends React.Component {
  state = {
    content: ''
  }

  handleChange = (event) => {
    this.setState({ content: event.target.value })
  }

  handleSubmit = async (event) => {
    event.preventDefault();

    const response = await axios.post(`/channels/${this.props.channel.id}/messages`, {
      team_channel_message: { content: this.state.content }
    })

    this.setState({ content: '' });
  }

  render() {
    if (this.props.allowed) {
      return (
        <form onSubmit={this.handleSubmit}>
          <div className="form-group string">
            <input onChange={this.handleChange} value={this.state.content} className="form-control string" name="team_channel_message[content]" />
          </div>
          <button className="btn btn-primary">
            Sent
          </button>
        </form>
      );
    } else {
      return (
        <span className='text-center'>
          In order to talk, you need to join team
          <form action={`/teams/${this.props.team.id}/join`} method="post">
            <button className="btn btn-primary">
              Join team
            </button>
          </form>
        </span>
      )
    }
  }
};

export default NewMessage;
