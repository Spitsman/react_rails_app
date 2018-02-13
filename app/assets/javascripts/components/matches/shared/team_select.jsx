this.TeamSelect = React.createClass({
  render: function(){
    return (
      <select value={this.props.value} name={this.props.name} placeholder={this.props.placeholder} onChange={this.props.onChange} className='form-control'>
        <option disabled selected value> {this.props.placeholder} </option>
        { this.props.teams.map((team, index) => <option key={index} value={team.id}>{team.name}</option>) }
      </select>
    );
  }
});
