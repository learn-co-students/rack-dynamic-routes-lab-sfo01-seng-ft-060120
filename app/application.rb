require 'pry'

class Application
 
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)

      if req.path.match(/items/)
        item_name = req.path.split("/items/").last
        present = Item.item.find_all {|item| item.name == item_name}
        if present.count > 0
          resp.write "#{present[0].price}"
        else
            resp.write "Item not found"
            resp.status = 400
        end

      else
        resp.write "Route not found"
        resp.status = 404
      end
   
      resp.finish
    end
  end