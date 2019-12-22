import React, { useState } from 'react';
import axios from 'axios';

const newMessage = (props) => {
  const [content, setContent] = useState('');

  const handleChange = (event) => {
    setContent(event.target.value);
  }

  const handleSubmit = async (event) => {
    event.preventDefault();

    const response = await axios.post(`/channels/${props.channel.id}/messages`, {
      team_channel_message: { content }
    })

    setContent('');
  }

  if (props.allowed) {
    return (
      <form onSubmit={handleSubmit}>
        <div className="form-group string">
          <input onChange={handleChange} value={content} className="form-control string" name="team_channel_message[content]" />
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
        <form action={`/teams/${props.team.id}/join`} method="post">
          <button className="btn btn-primary">
            Join team
          </button>
        </form>
      </span>
    )
  }
};

export default newMessage;
