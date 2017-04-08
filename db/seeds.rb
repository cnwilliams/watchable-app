# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.destroy_all

#need to change guidebox_id to imdb_id later

Movie.create([
  {
    guidebox_id: 54435,
   title: "The Hot Chick",
   release_date: 2002,
   rating: "PG-13",
   overview: "The hilarious Rob Schneider has been a gigolo. He's been an animal. And now a curse will make him something he's never been before -- a woman! Jessica Spencer is the hottest, most popular girl in high school. But she gets a big dose of reality when she wakes up in the body of a 30-something-year-old lowlife male (Schneider) and quickly discovers that trading on your looks isn't so easy when you're a girl who constantly needs a shave. How in the world can Jessica convince her friends (Anna Faris, Scary Movie, Scary Movie 2; Matthew Lawrence, Mrs.. Doubtfire; Eric Christian Olsen, Not Another Teen Movie) it really is her? And how can she change herself back into a teenage girl? The Hot Chick is a wild and wacky gender-bending comedy everyone can enjoy -- no matter what sex you are.",
   primary_genre: "Comedy",
   secondary_genre: "Fantasy",
   tertiary_genre: "",
   primary_free_name: "not available",
   primary_free_link: "",
   secondary_free_name: nil,
   secondary_free_link: nil,
   primary_web_source_name: "Xfinity",
   primary_web_source_link: "https://tv.xfinity.com/entity/7338637497483535112",
   secondary_web_source_name: "STARZ",
   secondary_web_source_link: "https://www.starz.com/movies/28947",
   primary_sub_source_name: "STARZ (Via Amazon Prime)",
   primary_sub_source_link:"http://www.amazon.com/gp/product/B0060D2SU6?spp=starzSub",
   secondary_sub_source_name: [],
   secondary_sub_source_link: "",
   cs_media_link: "https://www.commonsensemedia.org/movie-reviews/the-hot-chick",
   trailer: "http://api-widget.guidebox.com/embed.php?video=59350",
   sm_img: "http://static-api.guidebox.com/thumbnails_movies_small/54435-985281608-6462099161-2181367884-small-120x171.jpg",
   md_img: "http://static-api.guidebox.com/thumbnails_movies_medium/54435-5063651637-4574180972-284735975-medium-240x342.jpg",
   lg_img: "http://static-api.guidebox.com/thumbnails_movies/54435-9808077532-5767383338-8038227595-large-400x570.jpg"
   },
   {
    guidebox_id: 62858,
    title: "Berlin Calling",
    release_date: 2008,
    rating: "NR",
    overview: "A man tours clubs around the globe with his manager and girlfriend. On the eve of their largest album release he is admitted to a psychiatric clinic after overdosing at a gig.",
    primary_genre: "Comedy",
    secondary_genre: "Drama",
    tertiary_genre: "Music",
    primary_free_name: nil,
    primary_free_link: nil,
    secondary_free_name: nil,
    secondary_free_link: nil,
    primary_web_source_name: nil,
    primary_web_source_link: nil,
    secondary_web_source_name: nil,
    secondary_web_source_link: nil,
    primary_sub_source_name: "Netflix",
    primary_sub_source_link: "http://movies.netflix.com/Movie/70114977",
    secondary_sub_source_name: nil,
    secondary_sub_source_link: nil,
    cs_media_link: nil,
    trailer: nil,
    sm_img: "http://static-api.guidebox.com/thumbnails_movies_small/62858-8899941980-3572900659-2899683439-small-120x171.jpg",
    md_img: "http://static-api.guidebox.com/thumbnails_movies_medium/62858-4440193162-14032126-8743346342-medium-240x342.jpg",
    lg_img: "http://static-api.guidebox.com/thumbnails_movies/62858-7929868893-785681052-386133343-large-400x570.jpg"
    },
       {
    guidebox_id: 4487,
    title: "The Girl with the Dragon Tattoo",
    release_date: 2009,
    rating: "R",
    overview: "",
    primary_genre: "",
    secondary_genre: "",
    tertiary_genre: "",
    primary_free_name: nil,
    primary_free_link: nil,
    secondary_free_name: nil,
    secondary_free_link: nil,
    primary_web_source_name: nil,
    primary_web_source_link: nil,
    secondary_web_source_name: [],
    secondary_web_source_link: nil,
    primary_sub_source_name: "",
    primary_sub_source_link: "",
    secondary_sub_source_name: nil,
    secondary_sub_source_link: nil,
    cs_media_link: "https://www.commonsensemedia.org/movie-reviews/the-girl-with-the-dragon-tattoo-2009",
    trailer: "http://api-widget.guidebox.com/embed.php?video=10841",
    sm_img: "http://static-api.guidebox.com/thumbnails_movies_small/4487-5351958591-1661804691-8391855918-small-120x171.jpg",
    md_img: "http://static-api.guidebox.com/thumbnails_movies_medium/4487-8035095469-1293866700-3286746647-medium-240x342.jpg",
    lg_img: "http://static-api.guidebox.com/thumbnails_movies/4487-9810531204-1464307439-2653995897-large-400x570.jpg"
    }
    ])