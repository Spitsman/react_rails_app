this.ShowTeam = React.createClass({
  getInitialState: function() {
    return {
      team: this.props.data
    };
  },

  handleClick: function(e) {
    e.preventDefault();
    self = this;

    $.ajax({
      type: "GET",
      url: `${this.state.team.id}/toggle_favorite`,
      success: function (data) {
        self.setState(data);
      },
      error: function(data) {
        console.log('Fail!', data);
      }
    });
  },

  render: function() {
    const buttonClass = this.state.team.favorite ? 'btn btn-success' : 'btn btn-default'
    const buttonText = this.state.team.favorite ? 'You like this' : 'Like'

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
            <MatchesTable matches={this.state.team.matches} />
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
