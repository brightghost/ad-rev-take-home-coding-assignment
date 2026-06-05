import React, { Component } from "react";
import "./App.css";
import TopPaths from "./TopPathsWidget";

class App extends Component {
  render() {
    return (      
        <div className="App">
          <title>Conversion Journey</title>
          <TopPaths />
        </div>    
    );
  }
}
export default App;
