this.ShowTeam = React.createClass({
  getInitialState: function() {
    return {
      team: this.props.data
    };
  },

  handleClick: function(e) {
    e.preventDefault();

    $.get(`${this.state.team.id}/toggle_favorite`, {
    }, (function(_this) {
      return function(data) {
        console.log(data)
        return _this.setState(data);
      };
    })(this), 'JSON');
  },

  render: function() {
    const buttonClass = this.state.team.favorite ? 'btn btn-success' : 'btn btn-default'
    const buttonText = this.state.team.favorite ? 'You like this' : 'Like'
    const matches = this.state.team.matches.map((match) =>
      <Match
        key={match.id}
        match={match}
      />
    );

    return (
      <div>
        <div className='page-header'>
          <div className='pull-right'>
            <button className={buttonClass} onClick={this.handleClick}>
              { buttonText }
            </button>
          </div>
          <h2>{this.state.team.name}</h2>
        </div>
        <div className='page-body'>
          <div className='col-md-12'>
            <table className='table table-bordered'>
              <thead>
                <tr>
                  <th>First team</th>
                  <th>Second team</th>
                  <th>First team score</th>
                  <th>Second team score</th>
                  <th>Date</th>
                </tr>
              </thead>
              <tbody>
                { matches }
              </tbody>
            </table>
          </div>
          <div className='col-md-12'>
            <dl>
              <dt>Mаксимальное количество забитых голов в сыгранных матчах</dt>
              <dd>{ this.state.team.max_scoring_goal_count }</dd>
              <dt>Mаксимальное количество пропущенных голов в сыгранных матчах</dt>
              <dd>{ this.state.team.max_missed_goal_count }</dd>
              <dt>Команда-конкурент, близкая по количеству очков за турнир</dt>
              <dd>{ `${this.state.team.team_with_closest_score.name} – ${this.state.team.team_with_closest_score.total_score}` }</dd>
              <dt>Команда с максимальным отрывом по очкам</dt>
              <dd>{ `${this.state.team.team_with_max_score_margin.name} – ${this.state.team.team_with_max_score_margin.total_score}` }</dd>
            </dl>
          </div>
        </div>
      </div>
    )
  }
});
