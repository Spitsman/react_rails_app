this.MatchForm = React.createClass({
  getInitialState: function() {
    return {
      first_team_id: '',
      second_team_id: '',
      first_team_score: '',
      second_team_score: '',
      date: '',
      formError: false
    };
  },
  render: function() {
    return (
      <div>
        { this.state.formError &&
          <div className='alert alert-danger'>
            Введены неверные данные
          </div>
        }
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

    var self = this;

    $.ajax({
      type: "POST",
      url: "matches",
      data: {
        match: {
          first_team_id: this.state.first_team_id,
          second_team_id: this.state.second_team_id,
          first_team_score: this.state.first_team_score,
          second_team_score: this.state.second_team_score,
          date: this.state.date
        }
      },
      success: function (data) {
        self.props.handleNewMatch(data);
        self.setState(self.getInitialState());
      },
      error: function(data) {
        self.setState({formError: true});
      }
    });
  }
})
