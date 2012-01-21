require "rack-plastic"
require "fastimage"

module Rack
  class LazyLoad < Plastic

    def change_nokogiri_doc(doc)
      doc.css(".container img").each do |img|

        # Add width and height attributes if they don't exist
        size = FastImage.size(img["src"])
        unless size.nil?
          img["width"]  = size[0].to_s if img["width"].nil?
          img["height"] = size[1].to_s if img["height"].nil?
        end
        
        img["data-original"] = img["src"]
        img["src"] = "http://appelsiini.net/projects/lazyload/img/grey.gif"
      end
      doc
    end
        
  end
end
