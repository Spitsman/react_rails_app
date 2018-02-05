this.TeamForm = React.createClass({
  getInitialState: function() {
    return {
      name: ''
    };
  },
  render: function() {
    return (
      <div>
        <form className='form-inline' onSubmit={this.handleSubmit}>
          <div className='form-group'>
            <input name='name' type='text' className='form-control' placeholder='Название' value={this.state.name} onChange={this.handleChange}/>
            <button type='submit' className='btn btn-primary' disabled={!this.valid()}>
              Создать
            </button>
          </div>
        </form>
      </div>
    )
  },
  valid: function() {
    return this.state.name
  },
  handleChange: function(e) {
    let a = e.target.name
    let b = {}
    b[a] = e.target.value

    return this.setState(b)
  },


  handleSubmit: function(e) {
    e.preventDefault();

    var self = this;

    $.ajax({
      type: "POST",
      url: "teams",
      data: {
        team: {
          name: this.state.name
        }
      },
      success: function (data) {
        self.props.handleNewTeam(data);
        self.setState(self.getInitialState());
      },
      error: function(data) {
        console.log(data)
      }
    });
  }

})
