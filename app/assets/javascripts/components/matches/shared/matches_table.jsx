this.MatchesTable = React.createClass({

  render: function() {
    const matches = this.props.matches.map((match) =>
      <Match
        key={match.id}
        match={match}
      />
    );

    return (
      <table className='table table-bordered'>
        <thead>
          <tr>
            <th>Первая команда</th>
            <th>Вторая команда</th>
            <th>Счет первой команды</th>
            <th>Счет второй команды</th>
            <th>Дата</th>
          </tr>
        </thead>
        <tbody>
          { matches }
        </tbody>
      </table>
    )
  }
});
