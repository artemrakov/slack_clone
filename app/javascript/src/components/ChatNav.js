import React from 'react';
import cn from 'classnames';

const chatNav = (props) => {
  return (
    <ul className="nav flex-column nav-pills">
      {props.links.map(link => listItem(link, props))}
    </ul>
  );
}

const listItem = (item, props) => {
  const clickHandler = item.href ? null : props.click(item.id);
  const href = item.href ? item.href : '#';
  const classes = cn({
    'nav-link': true,
    'active': item.id == props.channel.id
  });

  return (
    <li key={item.id} className="nav-item">
      <a onClick={clickHandler} className={classes} href={href}>
        {item.name}
      </a>
    </li>
  );
}

export default chatNav;
