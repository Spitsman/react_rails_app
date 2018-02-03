this.TeamForm = React.createClass({
  getInitialState: function() {
    return {
      name: '',
      favorite: ''
    };
  },
  render: function() {
    return (
      <div>
        <form className='form-inline' onSubmit={this.handleSubmit}>
          <div className='form-group'>
            <input name='name' type='text' className='form-control' placeholder='Name' value={this.state.name} onChange={this.handleChange}/>
            <input name='favorite' type='text' className='form-control' placeholder='Favorite' value={this.state.favorite} onChange={this.handleChange}/>
            <button type='submit' className='btn btn-primary' disabled={!this.valid()}>
              Create
            </button>
          </div>
        </form>
      </div>
    )
  },
  valid: function() {
    return this.state.name && this.state.favorite
  },
  handleChange: function(e) {
    let a = e.target.name
    let b = {}
    b[a] = e.target.value

    return this.setState(b)
  },
  handleSubmit: function(e) {
    e.preventDefault();
    $.post('teams', {
      team: this.state
    }, (function(_this) {
      return function(data) {
        _this.props.handleNewTeam(data);
        return _this.setState(_this.getInitialState());
      };
    })(this), 'JSON');
  }

})
