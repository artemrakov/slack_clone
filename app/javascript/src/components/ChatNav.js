import React from 'react';
import cn from 'classnames';

const chatNav = (props) => {
  return (
    <ul className="nav flex-column nav-pills">
      {props.links.map(link => listItem(link))}
    </ul>
  );
}

const listItem = (item) => {
  const href = item.href ? item.href : '#';
  const classes = cn({
    'nav-link': true,
    'active': item.active
  });

  return (
    <li key={item.id} className="nav-item">
      <a className={classes} href={href}>
        {item.name}
      </a>
    </li>
  );
}

export default chatNav;
