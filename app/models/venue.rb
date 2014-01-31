class Venue < ActiveRecord::Base

  include Tire::Model::Search
  include Tire::Model::Callbacks

  def self.search(params)
    tire.search(load: true) do
      query {
        string "name:#{params[:query]} kana:#{params[:query]}"
      } if params[:query].present?
      filter :geo_distance, {
        distance: "#{params[:distance].present? ? params[:distance].to_f : 1.0}km",
        location: { lat: params[:lat].to_f, lon: params[:lng].to_f }
      } if params[:lat].present? && params[:lng].present?
    end
  end

  tire do
    mapping do
      indexes :name, analyzer: :kuromoji, boost: 100
      indexes :kana, analyzer: :kuromoji
      indexes :location, type: :geo_point, lat_lon: true
    end
  end

  def to_indexed_json
    {
      name: name,
      kana: kana,
      location: location
    }.to_json
  end

  def location
    { lat: lat.to_f, lon: lng.to_f }
  end

end
