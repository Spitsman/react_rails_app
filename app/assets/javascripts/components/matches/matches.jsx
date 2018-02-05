this.Matches = React.createClass({
  getInitialState: function(){
    return {
      matches: this.props.data
    };
  },

  getDefaultProps: function() {
    return {
      matches: []
    }
  },

  addMatch: function(match) {
    var matches = this.state.matches.slice()
    matches.push(match);
    this.setState({ matches: matches });
  },

  render: function() {


    return (
      <div>
        <h2>Матчи</h2>
        <MatchForm handleNewMatch={this.addMatch} />
        <hr/>
        <MatchesTable matches={this.state.matches} />
      </div>
    )
  }
});
