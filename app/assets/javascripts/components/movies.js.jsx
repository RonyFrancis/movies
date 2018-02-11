var Movies = createReactClass({

  /**
   * initialise state for react
   * @return json [empty movies_list]
   */
  getInitialState() {
    return { items: [] };
  },

  /**
   * update movies list
   * @return json [movielist]
   */
  componentDidMount() {
    $.getJSON('/v1/movies', (response) => {
      this.setState({ items: response });
    });
  },

  /**
   * render the list
   * @return html [rendered output]
   */
  render: function () {
    var movies = this.state.items.map(item => {
      return (
        <div className='Movieitem' key={item.id}>
          <h1>
             <a href={'/v1/movie/' + item.id}>{item.name} </a>
          </h1>
          <p>
            {item.description}
          </p>
        </div>
      );
    });
    return (
      <div>
        {movies}
      </div>
    );
  },
});
