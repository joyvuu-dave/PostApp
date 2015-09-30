# README
This is a simple API blogging application that allows CRUD operations around posts and comments on posts. Each of the endpoints available is detailed below.

There's a test suite you can run with ```rspec```. You can also load a seed database with ```rake db:seed```.

## POSTS
- GET /api/posts
  - returns 10 most recent posts
- POST /api/posts
  - creates a post
  - params: ```post: { title: String, content: Text, author_id: Integer }```
- GET /api/posts/:id
  - returns a post
- PATCH /api/posts/:id
  - updates a post
- DELETE /api/posts/:id
  - removes a post

## IMAGES
- POST /api/images
  - adds an image to a post
  - params: ```image: { url: String, post_id: Integer }```
- DELETE /api/images/:id
  - removes an image

## COMMENTS
- GET /api/comments?post_id=Integer
  - returns all comments associated with a post
- POST /api/comments
  - adds a comment to a post
  - params: ```comment: { body: Text, post_id: Integer, user_id: Integer, parent_id: Integer }```
- DELETE /api/comments/:id
  - removes a comment
