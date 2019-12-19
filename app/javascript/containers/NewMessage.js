import React from 'react';

class NewMessage extends React.Component {
  state = {
    content: ''
  }

  handleChange = (event) => {
    this.setState({ content: event.target.value })
  }

  handleSubmit = async (event) => {
    event.preventDefault();

    this.props.action({ content: this.state.content });
    this.setState({ content: '' });
  }

  render() {
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
  }
};

export default NewMessage;
