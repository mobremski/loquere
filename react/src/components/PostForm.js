import React, { Component } from 'react';

class PostForm extends Component {
  constructor(props) {
    super(props);
  };

  render() {

    return(
      <form onSubmit={this.props.handleFormSubmit}>
        <input
          id="text"
          type="text"
          value={this.props.body}
          placeholder="leave a message..."
          onChange={this.props.handleChange}
        />
        <input type="submit" className="button" value="Post" />
      </form>
    );
  };
};

export default PostForm;
