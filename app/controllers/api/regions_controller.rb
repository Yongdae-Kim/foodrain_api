module Api
  class RegionsController < ApplicationController
    def index
      if (params[:latitude] && params[:longitude]).present?
        request_geocoder(params[:longitude], params[:latitude])
      else
        @regions = Region.all.find_by_name(params[:name])
      end
    end

    private

    def request_geocoder(lng, lat)
      query = [lng, lat].compact.join(',')
      result = Geocoder.search(query).first
      @regions = Array[]
      @regions.push(mapping_region(result))
    end

    def mapping_region(loc)
      addr = loc.address.split
      @region = Region.new(
        do: addr[1],
        gu: addr[2],
        dong: [addr[3], addr[4]].compact.join(' '),
        latitude: loc.latitude,
        longitude: loc.longitude
      )
    end
  end
end
