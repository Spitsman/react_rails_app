this.MatchForm = React.createClass({
  getInitialState: function() {
    return {
      first_team_id: '',
      second_team_id: '',
      first_team_score: '',
      second_team_score: '',
      date: ''
    };
  },
  render: function() {
    return (
      <div>
        <form className='form-inline' onSubmit={this.handleSubmit}>
          <div className='form-group'>
            <input name='first_team_id' type='number' className='form-control-sm' placeholder='Id 1-й команды' value={this.state.first_team_id} onChange={this.handleChange}/>
            <input name='second_team_id' type='number' className='form-control-sm' placeholder='Id 2-й команды' value={this.state.second_team_id} onChange={this.handleChange}/>
            <input name='first_team_score' type='number' className='form-control-sm' placeholder='Счет 1-й команды' value={this.state.first_team_score} onChange={this.handleChange}/>
            <input name='second_team_score' type='number' className='form-control-sm' placeholder='Счет 2-й команды' value={this.state.second_team_score} onChange={this.handleChange}/>
            <input name='date' type='text' className='form-control-sm' placeholder='Дата' value={this.state.date} onChange={this.handleChange}/>
            <button type='submit' className='btn btn-sm btn-primary' disabled={!this.valid()}>
              Создать
            </button>
          </div>
        </form>
      </div>
    )
  },

  handleChange: function(e) {
    let a = e.target.name
    let b = {}
    b[a] = e.target.value

    return this.setState(b)
  },

  valid: function() {
    return this.state.first_team_id && this.state.second_team_id && this.state.first_team_score && this.state.second_team_score && this.state.date
  },

  handleSubmit: function(e) {
    e.preventDefault();
    $.post('matches', {
      match: this.state
    }, (function(_this) {
      return function(data) {
        _this.props.handleNewMatch(data);
        return _this.setState(_this.getInitialState());
      };
    })(this), 'JSON');
  }
})
