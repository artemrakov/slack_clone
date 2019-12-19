import React from 'react';

const messages = (props) => {
  return (
    <ul className="list-group pb-5">
      {props.messages.map(item => (
        <li key={item.id} className="list-group-item">
          <p>{item.user.first_name}</p>
          {item.content}
          <a onClick={props.delete(item.id)} className="float-right" href="#">
            <span>Delete</span>
          </a>
        </li>
      ))}
    </ul>
  );
};

export default messages;
