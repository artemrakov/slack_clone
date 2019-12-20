import React from 'react';

const messages = (props) => {
  const link = (item) => (
    <a onClick={props.delete(item.id)} className="float-right" href="#">
      <span>Delete</span>
    </a>
  )

  return (
    <ul className="list-group pb-5">
      {props.messages.map(item => (
        <li key={item.id} className="list-group-item">
          <p>{item.user.first_name}</p>
          {item.content}
          {item.user_id === props.user.id ? link(item) : null }
        </li>
      ))}
    </ul>
  );
};

export default messages;
