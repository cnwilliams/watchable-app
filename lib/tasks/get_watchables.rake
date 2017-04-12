require 'JSON'
require 'rest-client'
# require 'dovenv'

namespace :get_watchables do
  desc "Movie seed data"
  task get_movies: :environment do
    host = "http://api-public.guidebox.com/v2"
    api_key = "<%= Figaro.env.guidebox_api_key %>"

    res = RestClient.get"#{host}/movies?api_key=#{api_key}"
    res = JSON.parse(res)

    # def already_in_db?(movie_id)
    #   Movie.find_by_id(movie_id)
    # end
# how to prevent creating a movie that is already in the db??
    res['results'].each do |movie|

      m = {}

      m[:guidebox_id] = movie["id"]
      m[:title] = movie["title"]
      m[:release_date] = movie["release_date"]
      m[:rating] = movie["rating"]
      m[:cs_media_link] = movie["common_sense_media"]
      m[:sm_img] = movie["poster_120x171"]
      m[:md_img] = movie["poster_240x342"]
      m[:lg_img] = movie["poster_400x570"]

      # now search for each specific movie to get additional data
      more_data = RestClient.get "http://api-public.guidebox.com/v2/movies/#{m[:guidebox_id].to_i}?api_key=#{api_key}"
      movie = JSON.parse(more_data)


      # should put this in a join table moving forward :(
        if movie["genres"] != []
          m[:primary_genre] = movie["genres"][0]["title"]

          if movie["genres"][1] != nil
            m[:secondary_genre] = movie["genres"][1]["title"]
          end

          if movie["genres"][2] != nil
            m[:tertiary_genre] = movie["genres"][2]["title"]
          end
        end

        if movie["free_web_sources"] != []
          m[:primary_free_name] = movie["free_web_sources"][0]["display_name"]
          m[:primary_free_link] = movie["free_web_sources"][0]["link"]

          if movie["free_web_sources"][1] != nil
            m[:secondary_free_name] = movie["free_web_sources"][1]["display_name"]
            m[:secondary_free_link] = movie["free_web_sources"][1]["link"]
          end
        end

        if movie["tv_everywhere_web_sources"] != []
          m[:primary_web_source_name] = movie["tv_everywhere_web_sources"][0]["display_name"]
          m[:primary_web_source_link] = movie["tv_everywhere_web_sources"][0]["link"]

          if movie["tv_everywhere_web_sources"][1] != nil
            m[:secondary_web_source_name] = movie["tv_everywhere_web_sources"][1]["display_name"]
            m[:secondary_web_source_link] = movie["tv_everywhere_web_sources"][1]["link"]
          end
        end

        if movie["subscription_web_sources"] != []
          # if "STARZ (Via Amazon Prime)", display "Amazon Prime"

          if movie["subscription_web_sources"][0]["display_name"].include?("Amazon")
            m[:primary_sub_source_name] = "Amazon Prime"
            m[:primary_sub_source_link] = movie["subscription_web_sources"][0]["link"]
          else
            m[:primary_sub_source_name] = movie["subscription_web_sources"][0]["display_name"]
            m[:primary_sub_source_link] = movie["subscription_web_sources"][0]["link"]
          end
        end

        if movie["subscription_web_sources"][1] != nil
          # if "STARZ (Via Amazon Prime)", display "Amazon Prime"
          if movie["subscription_web_sources"][1]["display_name"].include?("Amazon")
            m[:secondary_sub_source_name] = "Amazon Prime"
            m[:secondary_sub_source_link] = movie["subscription_web_sources"][1]["link"]
          else
            m[:secondary_sub_source_name] = movie["subscription_web_sources"][1]["display_name"]
            m[:secondary_sub_source_link] = movie["subscription_web_sources"][1]["link"]
          end
        end

        # last bits!

        if  movie["trailers"] != []
          if movie["trailers"]["web"] != []
            m[:trailer] = movie["trailers"]["web"][0]["embed"]
          end
        end

        if movie["overview"] != []
          m[:overview] = movie["overview"]
        end

        # create movie after nested iteration
        Movie.create(m)
    end
  end

end
