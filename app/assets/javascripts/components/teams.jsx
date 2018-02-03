this.Teams = React.createClass({
  getInitialState: function() {
    return {
      teams: this.props.data
    };
  },
  getDefaultProps: function() {
    return {
      teams: []
    };
  },
  addTeam: function(team) {
    var teams = this.state.teams.slice();
    teams.push(team);
    return this.setState({
      teams: teams
    });
  },
  render: function() {
    const teams = this.state.teams.map((team) =>
      <Team
        key={team.id}
        team={team}
      />
    );

    return (
      <div>
        <h2>Teams</h2>
        <TeamForm handleNewTeam={this.addTeam} />
        <hr/>
        <table className='table table-bordered'>
          <thead>
            <tr>
              <th>Name</th>
              <th>Favorite</th>
            </tr>
          </thead>
          <tbody>
            { teams }
          </tbody>
        </table>
      </div>
    )
  }
});
