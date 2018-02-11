var NewReview = createReactClass({

  /**
   * [getInitialise state for react]
   * @param  {[json} props [selected movie_id]
   * @return {[json]}       [set of state]
   */
  getInitialState(props) {
    return { ratings: [],
      movie_id: this.props.movie_id,
    };
  },

  /**
   * [call the create ratings api]
   * @return {[function]} [function to be executed on parent component]
   */
  handleClick() {
    let rate = jQuery('#rate').val();
    let comment = jQuery('#comment').val();
    let url = '/v1/create';
    let data = { rating: { movie_id: this.props.movieId, rate: rate, comment: comment } };
    $.post(url, data, (response) => {
      console.log('it worked', response);
      this.props.handleSubmit(response);
    });
  },

  /**
   * [render output]
   * @return {[html]} [html output]
   */
  render: function () {
    return (
      <div>
        <select id="rate"  name="rate" >
           <option value="1">1</option>
           <option value="2">2</option>
           <option value="3">3</option>
           <option value="4">4</option>
           <option value="5">5</option>
         </select>
         <input type="text" id="comment" name="comment" placeholder='Enter a comment' />
         <button onClick={this.handleClick}>Submit</button>
      </div>
    );
  },
});
