this.Team = React.createClass({
  render: function() {
    return (
      <tr>
        <td> {this.props.team.id} </td>
        <td>
          <TeamName
            favorite={this.props.team.favorite}
            name={this.props.team.name}
            id={this.props.team.id}
          />
        </td>
        <td> {this.props.team.favorite ? '✓' : '–'} </td>
      </tr>
    )
  }
});
