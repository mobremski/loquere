import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import BoardList from './components/BoardList';
import UserList from './components/UserList'

$(function() {
  ReactDOM.render(
      <UserList />,
    document.getElementById('app')
  );
});

$(function() {
  ReactDOM.render(
      <BoardList />,
    document.getElementById('board')
  );
});
