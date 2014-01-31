class Venue < ActiveRecord::Base

  include Tire::Model::Search
  include Tire::Model::Callbacks

  after_save do
    update_index
    # update_index if searchable
  end

  def self.search(params)
    tire.search(load: true) do
      query { string "name:#{params[:query]}" } if params[:query].present?
      filter :geo_distance, {
        distance: "#{params[:distance].present? ? params[:distance].to_f : 1.0}km",
        location: { lat: params[:lat].to_f, lon: params[:lng].to_f }
      } if params[:lat].present? && params[:lng].present?
    end
  end

  mapping do
    indexes :id, type: :string, index: :not_analyzed
    indexes :name, analyzer: :kuromoji, boost: 10
    indexes :kana, analyzer: :kuromoji
    indexes :category, analyzer: :keyword
    indexes :has_coupon, analyzer: :boolean
    indexes :location, type: :geo_point, lat_lon: true
    indexes :updated_at, type: :date, include_in_all: false
  end

  def to_indexed_json
    {
      id: id,
      name: name,
      kana: kana,
      category: category,
      has_coupon: has_coupon,
      location: location,
      updated_at: updated_at
    }.to_json
  end

  def location
    { lat: lat.to_f, lon: lng.to_f }
  end

end
