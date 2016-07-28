import React, { Component } from 'react';
import User from './User.js'

class UserList extends Component {
  constructor(props) {
    super(props);
    let meetup_id = $('#meetup_id').val();
    let current_user = $('#current_user').val();
    let membership_current = $('#membership_current').val();
    let current_member = $('#current_member').val();
    this.state = {
      users: [],
      joined: (current_member == current_user),
      meetup_id: meetup_id,
      current_user: current_user,
      membership_current: membership_current,
      current_member: current_member
    };
    this.handleClickJoin = this.handleClickJoin.bind(this)
    this.handleClickLeave = this.handleClickLeave.bind(this)
  }

  componentDidMount() {
    event.preventDefault();
    $.ajax({
      method: "GET",
      url: `/api/meetups/${this.state.meetup_id}/memberships/`,
      contentType: "application/json"
    })
    .done(data => {
      this.setState({ users: data.users });
    });
  }

  handleClickJoin (event) {
    this.setState({joined: !this.state.joined});
    let newMembership = JSON.stringify({
        meetup_id: this.state.meetup_id,
        user_id: this.state.current_user
    });

    $.ajax({
      method: "POST",
      url: `/api/meetups/${this.state.meetup_id}/memberships/`,
      contentType: "application/json",
      data: newMembership
    })
    .done(data => {
      let newUsers = [...this.state.users, data["user"]];
      this.setState({
      users: newUsers,
      membership_current: data["membership_current"]
      })
    })
  }

  handleClickLeave () {
    let userList = this;
    this.setState({joined: !this.state.joined});
    $.ajax({
      method: "DELETE",
      url: `/api/meetups/${this.state.meetup_id}/memberships/${this.state.membership_current}`,
      contentType: "application/json"
    })
    .done( (data) => {
      let newUsers = [];
      for (var i = 0; i < userList.state.users.length; i++) {
        if (userList.state.users[i].id !== data.user) {
          newUsers.push(userList.state.users[i]);
        }
      }
      this.setState({ users: newUsers, current_member: null })
    });
  }

  render() {
    let user_signed_in = $('#user_signed_in').val();
    let button;
    if (this.state.current_user) {
      if (this.state.joined) {
        button = <button className="button" onClick={this.handleClickLeave}>Leave</button>
      } else {
        button = <button className="button" onClick={this.handleClickJoin}>Join</button>
      }
    }

    let userList = this.state.users.map((user) => {
      return(
        <User
          key={user.id}
          screen_name={user.screen_name}
        />
      );
    });

    return(
      <div>
        <div className="members-list-header-button">
          <h4>Members</h4>
          {button}
        </div>
        <div className="members-list">
          <ul>
            {userList}
          </ul>
        </div>
      </div>
    );
  };
};

export default UserList;
