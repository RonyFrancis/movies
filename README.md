# README

Movies application is used to list movies and give rating to them.
The backend apis are made up of rails (5.1.4) and client-ui is made using react-rails.
The Database used is sqlite3

App Installation & Running
*  bundle install
       install all necessary gems for the application
*  rake db:create
      create an sqlite Database
*  rake db:migrate
      Run all the migrations
*  rake db:seeds
      initialise the Database
*  bundle exec rspec
      Run all the tests
*  bundle exec rails s or rails s
      run the rails server at port 3000

Sample Apis and Responses

1. Movies Api
   * command: curl http://localhost:3000/v1/movies|json_pp
   * response:
    ```
    [
   {
      "name" : "ironman",
      "avg_rating" : 0,
      "id" : 1,
      "created_at" : "2018-02-11T18:13:46.796Z",
      "updated_at" : "2018-02-11T18:13:46.796Z",
      "description" : "suit"
   },
   {
      "updated_at" : "2018-02-11T18:13:46.946Z",
      "description" : "hulk smash",
      "avg_rating" : 0,
      "id" : 2,
      "name" : "hulk",
      "created_at" : "2018-02-11T18:13:46.946Z"
   },
   {
      "updated_at" : "2018-02-11T18:13:47.038Z",
      "description" : "hammer",
      "avg_rating" : 0,
      "name" : "thor",
      "id" : 3,
      "created_at" : "2018-02-11T18:13:47.038Z"
   },
   {
      "description" : "shield",
      "updated_at" : "2018-02-11T18:13:47.129Z",
      "created_at" : "2018-02-11T18:13:47.129Z",
      "avg_rating" : 0,
      "name" : "captain america",
      "id" : 4
   },
   {
      "updated_at" : "2018-02-11T18:13:47.221Z",
      "description" : "team",
      "id" : 5,
      "avg_rating" : 0,
      "name" : "avenger",
      "created_at" : "2018-02-11T18:13:47.221Z"
   },
   {
      "description" : "suit",
      "updated_at" : "2018-02-11T18:15:01.570Z",
      "created_at" : "2018-02-11T18:15:01.570Z",
      "avg_rating" : 0,
      "name" : "ironman",
      "id" : 6
   },
   {
      "created_at" : "2018-02-11T18:15:01.705Z",
      "name" : "hulk",
      "avg_rating" : 0,
      "id" : 7,
      "description" : "hulk smash",
      "updated_at" : "2018-02-11T18:15:01.705Z"
   },
   {
      "created_at" : "2018-02-11T18:15:01.805Z",
      "avg_rating" : 0,
      "name" : "thor",
      "id" : 8,
      "description" : "hammer",
      "updated_at" : "2018-02-11T18:15:01.805Z"
   },
   {
      "updated_at" : "2018-02-11T18:15:01.888Z",
      "description" : "shield",
      "id" : 9,
      "avg_rating" : 0,
      "name" : "captain america",
      "created_at" : "2018-02-11T18:15:01.888Z"
   },
   {
      "updated_at" : "2018-02-11T18:15:01.988Z",
      "description" : "team",
      "avg_rating" : 0,
      "id" : 10,
      "name" : "avenger",
      "created_at" : "2018-02-11T18:15:01.988Z"
   }
]
```

Note: by default movies are listed based on average rating of the movies

2. Movie info api
     List details for that particular movie
  * command: curl http://localhost:3000/v1/movies/1|json_pp
  * params: id
  * response:
   ```
   [
   {
      "avg_rating" : 0,
      "movie" : {
         "name" : "ironman",
         "created_at" : "2018-02-11T18:13:46.796Z",
         "avg_rating" : 0,
         "updated_at" : "2018-02-11T18:13:46.796Z",
         "description" : "suit",
         "id" : 1
      },
      "review" : []
   }
]
```

3. Average Rating of a Movie
  * command: curl http://localhost:3000/v1/movies/1/average_rating|json_pp
  * params: id
  * response:
  ```
   {
   "rating" : {
      "avg_rating" : 0
   }
}
```

4. Rating Api
   * command: curl --data "rating[movie_id]=1&rating[rate]=5&rating[comment]=great movie" http://localhost:3000/v1/movies/1/rating |json_pp
   * params: rating: { movie_id: id_of_the_movie, rate: rating_from_1_to_5, comment: coments_if_any },
           id: movie id
   * response:
    ```
    {
   "updated_at" : "2018-02-12T00:56:56.353Z",
   "created_at" : "2018-02-12T00:56:56.353Z",
   "id" : 3,
   "rate" : 5,
   "movie_id" : 1,
   "comment" : "great movie"
}
```

5. Voting Api
    * command: curl --data "vote[rating_id]=1&vote[vote]=down" http://localhost:3000/v1/vote|json_pp
    * params: vote: { rating_id: id_of_the_rating_which_u_r_voting, vote: status_is_up_or_down }
    * response:
    ```
     {
   "vote" : {
      "vote_type" : "down"
   }
}
```

Dashboard

6. Login
  * url: http://localhost:3000/v1/login
  * login_params:
     username: user1
     password: 123456

7. Dashboard
   * url: http://localhost:3000/v1/dashboard

8. Movie page
  * url: http://localhost:3000/v1/movie/1
