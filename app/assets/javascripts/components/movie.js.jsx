var Movie = createReactClass({

  /**
   * [initialises state for react]
   * @param  {[json]} props [selected movie_id]
   * @return {[json]}       [state]
   */
  getInitialState(props) {
    return { items: [],
      movie_id: this.props.movie_id,
      ratings: [],
      avgRating: [],
    };
  },

  /**
   * [ state changes]
   * @param  {[json]} props [properties of this class]
   * @return {[json]}       [new state]
   */
  componentDidMount(props) {
    let url = '/v1/movies/' + this.state.movie_id;
    $.getJSON(url, (response) => {
      this.setState({ items: response[0].movie });
      this.setState({ ratings: response[0].review });
      this.setState({ avgRating: response[0].avg_rating });
    });
  },

  /**
   * [update average rating & ratings]
   * @param  {[json]} item [new rating to be added]
   * @return {[json]}      [new updated state]
   */
  handleSubmit(item) {
    let newState = this.state.ratings.concat(item);
    let url = '/v1/movies/' + item.movie_id + '/average_rating';
    $.getJSON(url, (response) => {
      this.setState({ avgRating: response.rating.avg_rating });
    });
    this.setState({ ratings: newState });
  },

  /**
   * [call voting api]
   * @param  {[string]} status [status of the vote up or down]
   * @param  {[integer]} id    [id of the rating ]
   * @return {[console log]}          [console saying success]
   */
  vote(status, id) {
    let url = '/v1/vote';
    let data = { vote: { rating_id: id, vote: status } };
    $.post(url, data, (response) => {
      console.log('it worked', response);
    });
  },

  /**
   * [render output]
   * @return {[html]} [rendered output]
   */
  render: function () {
    var ratings = this.state.ratings.map(item => {
      return (
        <div>
          <div>
            Rate: {item.rate}
          </div>
          <p>
            Comment : {item.comment}
          </p>
          <div>
            <button onClick ={ () => {this.vote('up', item.id);} }
               >up</button>
             <button onClick={ () => {this.vote('down', item.id);} }
               >down</button>
          </div>
          </div>
      );
    });

    var review = <div>
      <div> Name : {this.state.items.name} </div>
      <div> Description : {this.state.items.description} </div>
      <div> Average Rating : {this.state.avgRating} </div>
    </div>;
    return (
      <div>
        <div>
          {review}
        </div>
        <div>
          <NewReview movieId ={this.state.movie_id } handleSubmit={this.handleSubmit}/>
        </div>
        <div>
          {ratings}
        </div>
      </div>
    );
  },
});
