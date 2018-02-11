/**
 * [description]
 * @return {[type]} [description]
 */
function fetchMovies() {
  $.ajax({ url: '/v1/movies', success: function (result) {
        let json = JSON.stringify(result);
        $('#div1').html(json);
      }, });
}
