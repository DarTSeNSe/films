require 'open-uri'

class Film < ActiveRecord::Base

  def self.add_film(link)
    doc = Nokogiri::HTML(open('http://kinozal.tv/details.php?id=1245194'))
    doc.encoding = 'utf-8'

    qwe = ''
    qwe2 = ''
    description = ''

    doc.css('h2').each do |link|
      qwe += link.content
    end
    doc.css('.justify.mn2.pad5x5').each do |link|
      qwe2 += link.content
    end


    doc.css('p').each do |link|
      description += link.content.split(": ").last
    end

    asd = []
    (qwe.split("\r\n") + qwe2.split("\r\n")).each do |qw|
      asd << qw.split(": ").last
    end

    name, original_name, year, genre, released, director, cast, quality, video, audio, size, duration, translation, subtitles = asd

    film_attributes = {
        name: name,
        original_name: original_name,
        year: year,
        genre: genre,
        released: released,
        director: director,
        cast: cast,
        quality: quality,
        video: video,
        audio: audio,
        size: size,
        duration: duration,
        translation: translation,
        subtitles: subtitles,
        description: description,
        link: link
    }
    p film_attributes
    Film.where(film_attributes).first_or_create
  end
end
