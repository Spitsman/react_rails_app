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
          <div className='col-md-6'>
            <dl>
              <dt>Mаксимальное количество забитых голов в сыгранных матчах</dt>
              <dd>{ this.state.team.max_scoring_goal_count }</dd>
              <dt>Mаксимальное количество пропущенных голов в сыгранных матчах</dt>
              <dd>{ this.state.team.max_missed_goal_count }</dd>
            </dl>

          </div>
          <div className='col-md-6'>
            test
          </div>
        </div>
      </div>
    )
  }
});
