import React, { Component } from 'react';
import Post from './Post.js'
import PostForm from './PostForm.js'

class BoardList extends Component {
  constructor(props) {
    super(props);
    let meetup_id = $('#meetup_id').val();
    let current_user = $('#current_user').val();
    let current_member = $('#current_member').val();
    this.state = {
      posts: [],
      body: '',
      meetup_id: meetup_id,
      current_user: current_user,
      current_member: current_member
    };
    this.handleFormSubmit = this.handleFormSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.handleButtonClick = this.handleButtonClick.bind(this);
  }

  componentDidMount() {
    event.preventDefault();
    $.ajax({
      method: "GET",
      url: `/api/meetups/${this.state.meetup_id}/posts`,
      contentType: "application/json"
    })
    .done(data => {

      this.setState({ posts: data.posts });

    });
  }

  handleChange(event) {
    let newBody = event.target.value;
    this.setState({ body: newBody });
  }

  handleFormSubmit (event) {
    event.preventDefault();
    let newPost = JSON.stringify({
      post: {
       body: this.state.body,
       meetup_id: this.state.meetup_id,
       user_id: this.state.current_user
     }
    });

    $.ajax({
      method: "POST",
      url: `/api/meetups/${this.state.meetup_id}/posts/`,
      contentType: "application/json",
      data: newPost
    })
    .done(data => {
      let post = data["post"];
      post.user = data["user"]
      let newPosts = [...this.state.posts, post];
      this.setState({
      posts: newPosts,
      body: ""
      })
    })
  }

  handleButtonClick (id) {
    event.preventDefault();
    let postsList = this;
    $.ajax({
      method: "DELETE",
      url: `/api/meetups/${this.state.meetup_id}/posts/` + id,
      contentType: "application/json"
    })
    .done( (data) => {
      let newPosts = [];
      for (var i = 0; i < postsList.state.posts.length; i++) {
        if (postsList.state.posts[i].id !== data.post.id) {
          newPosts.push(postsList.state.posts[i]);
        }
      }
      this.setState({ posts: newPosts })
    });
  }


  render() {
    let postList = this.state.posts.map((post) => {
      return(
        <Post
          key={post.id}
          id={post.id}
          body={post.body}
          user={post.user}
          currentUser={this.state.current_user}
          handleButtonClick={this.handleButtonClick}
        />
      );
    });
    return(
      <div>
        <div className="post-form-header">
          <h4> Messages </h4>
          <PostForm
            currentMember={this.state.current_member}
            currentUser={this.state.current_user}
            handleFormSubmit={this.handleFormSubmit}
            handleChange={this.handleChange}
          />
        </div>
        <div className="post-list">
          {postList}
        </div>
      </div>
    );
  };
};

export default BoardList;
