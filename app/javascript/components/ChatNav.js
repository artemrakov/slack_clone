import React from 'react';

const chatNav = (props) => {
  return (
    <ul className="nav flex-column nav-pills">
      {props.links.map(link => (
        <li key={link.id} className="nav-item">
          <a className={`nav-link ${link.active ? 'active' : ''}`} href={link.href ? link.href : '#'}>
            {link.name}
          </a>
        </li>
      ))}
    </ul>
  );
}

export default chatNav;
