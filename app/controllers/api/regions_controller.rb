module Api
  class RegionsController < ApplicationController
    def index
      if (params[:latitude] && params[:longitude]).present?
        request_geocoder(params[:latitude], params[:longitude])
      else
        start = Time.now
        @regions = Region.all.find_by_name(params[:name])
        finish = Time.now
        diff = (finish - start) * 1000.0
        puts '###### 경과시간 : ' + diff.to_s + ' #####'
      end
    end

    private

    def request_geocoder(lat, lng)
      query = [lat, lng].compact.join(',')
      result = Geocoder.search(query).first
      @regions = Array[]
      @regions.push(mapping_region(result))
    end

    def mapping_region(result)
      addr = result.address.split
      @region = Region.new(
        do: addr[1],
        gu: addr[2],
        dong: [addr[3], addr[4]].compact.join(' '),
        latitude: result.latitude,
        longitude: result.longitude
      )
    end
  end
end
