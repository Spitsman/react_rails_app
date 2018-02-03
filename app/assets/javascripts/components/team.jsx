this.Team = React.createClass({
  render: function() {
    return (
      <tr>
        <td>
          <TeamName
            favorite={this.props.team.favorite}
            name={this.props.team.name}
            id={this.props.team.id}
          />
        </td>
        <td> {this.props.team.favorite_sign} </td>
      </tr>
    )
  }
});
