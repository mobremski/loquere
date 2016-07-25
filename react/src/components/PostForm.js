import React, { Component } from 'react';

class PostForm extends Component {
  constructor(props) {
    super(props);
  };

  render() {


    return(
      <form onSubmit={this.props.handleFormSubmit}>
        <label htmlFor="text">Leave a message</label>
        <input
          id="text"
          type="text"
          placeholder="leave a message..."
          value={this.props.body}
          onChange={this.props.handleChange}/>
        <input type="submit" className="button" value="Post" />
      </form>
    );
  };
};

export default PostForm;
