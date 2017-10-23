import React, { Component } from 'react';
import DistanceCalculator from './components/distance-calculator';

class App extends Component {
  render() {
    return (
      <div className="app">
        <header className="app-header">
          <img className="app-logo" src={window.images.plane} />
          <h1 className="app-title">US Airport Distance Calculator</h1>
          <div className="app-designer"> Built & Designed by <a href="https://www.chrishakos.com">Chris Hakos</a></div>
        </header>
        <DistanceCalculator />
      </div>
    );
  }
}

export default App;
