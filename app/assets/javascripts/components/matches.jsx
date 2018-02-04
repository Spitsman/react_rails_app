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
    const matches = this.state.matches.map((match) =>
      <Match
        key={match.id}
        match={match}
      />
    );

    return (
      <div>
        <h2>Матчи</h2>
        <MatchForm handleNewMatch={this.addMatch} />
        <hr/>
        <table className='table table-bordered'>
          <thead>
            <tr>
              <th>Первая команда</th>
              <th>Вторая команда</th>
              <th>Счет первой команды</th>
              <th>Счет второй команды</th>
              <th>Дата</th>
            </tr>
          </thead>
          <tbody>
            { matches }
          </tbody>
        </table>
      </div>
    )
  }
});
