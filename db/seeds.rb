# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([{ name: 'Barack Obama', city: 'Chicago' },
                     { name: 'Michael Jordan', city: 'Chicago' },
                     { name: 'George W. Bush', city: 'Dallas' },
                     { name: 'Bill Clinton', city: 'Little Rock' },
                     { name: 'Jimmy Carter', city: 'Atlanta' }])

posts = Post.create([{ author: users[0], title: 'Keys to a Successful Presidency', content: 'A good president needs to have a dog named Bo.' },
                     { author: users[2], title: 'How to Enjoy Retirement', content: 'Painting is a really good way to stay busy in retirement.' }])

Image.create([{ post: posts[0], url: 'https://upload.wikimedia.org/wikipedia/commons/7/7a/First_Dog_Bo_Obama.jpg' },
              { post: posts[1], url: 'http://www.bushcenter.org/sites/default/files/styles/extralarge_slideshow/public/putin.jpg?itok=qAB6uN8a' },
              { post: posts[1], url: 'http://www.designboom.com/wp-content/uploads/2014/04/george-w.-bush-exhibits-30-painted-portraits-of-world-leaders-designboom-10.jpg'}])

comments = Comment.create([{ post: posts[0], user: users[3], body: 'In my experience, a cat named Socks is vital.' },
                           { post: posts[1], user: users[4], body: 'I\'ve found peanut farming to be a really fun hobby.' },
                           { post: posts[1], user: users[0], body: 'Who here likes to body surf?' },
                           { post: posts[1], user: users[1], body: 'Anyone up for a game of HORSE?'}])

Comment.create({ post: posts[0], user: users[2], body: 'What about a dog named Miss Beazley?', parent: comments[0] })
