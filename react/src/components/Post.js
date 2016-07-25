import React from 'react';



const Post = props => {
  let handleClick = (event) => {
    props.handleButtonClick(props.id);
  }

  let button;
  if (props.currentUser == props.user.id) {
    button = <button className="button" type="button" onClick={handleClick}>Delete</button>
  }
  return (
    <li className="post">
      <div>
        <span>{props.body}</span>
        <p>{props.user.screen_name}</p>
      </div>
      <div>
        {button}
      </div>
    </li>
  );
};

export default Post;
