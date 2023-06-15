import React from 'react';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';
import ReservationList from './components/ReservationList';
import ReservationDetail from './components/ReservationDetail';
import ReservationForm from './components/ReservationForm';

function App() {
  return (
    <Router>
      <Switch>
        <Route exact path="/" component={ReservationList} />
        <Route exact path="/reservation/:id" component={ReservationDetail} />
        <Route exact path="/create-reservation" component={ReservationForm} />
      </Switch>
    </Router>
  );
}

export default App;