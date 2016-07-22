import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import UserList from './components/UserList';

$(function() {
  ReactDOM.render(
    <UserList />,
    document.getElementById('app')
  );
});
