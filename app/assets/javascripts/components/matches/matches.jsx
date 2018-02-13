this.Matches = React.createClass({
  getInitialState: function(){
    return {
      matches: this.props.matches,
      teams: this.props.teams
    };
  },

  getDefaultProps: function() {
    return {
      matches: [],
      teams: []
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
        <MatchForm handleNewMatch={this.addMatch} teams={this.state.teams} />
        <hr/>
        <MatchesTable matches={this.state.matches} />
      </div>
    )
  }
});
