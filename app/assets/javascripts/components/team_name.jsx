this.TeamName = React.createClass({

  render: function() {
    console.log(this.props.favorite);
    if (this.props.favorite) {
      text = <strong>{this.props.name}</strong>;
    } else {
      text = <span>{this.props.name}</span>
    }

    return (
      <a href={`/teams/${this.props.id}`}>
        { text }
      </a>
    )
  }
});
