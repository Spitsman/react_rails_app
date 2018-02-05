this.TeamName = React.createClass({

  render: function() {
    var text;
    
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
