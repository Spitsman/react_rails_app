this.Match = React.createClass({
  render: function() {

    const firstTeam = this.props.match.first_team
    const secondTeam = this.props.match.second_team

    return (
      <tr>
        <td>
          <TeamName
            favorite={firstTeam.favorite}
            name={firstTeam.name}
            id={firstTeam.id}
          />
        </td>
        <td> {this.props.match.second_team} </td>
        <td> {this.props.match.first_team_score} </td>
        <td> {this.props.match.second_team_score} </td>
        <td> {this.props.match.date} </td>
      </tr>
    )
  }
});
