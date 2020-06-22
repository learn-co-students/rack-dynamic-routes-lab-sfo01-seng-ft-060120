

class Application

   @@item = [Item.new("Figs",3.42),Item.new("Pears",0.99)]

    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
   
      if req.path.match(/items/)
   
        returned_item = req.path.split("/items/").last
        found_item = @@item.find{|item| item.name == returned_item}
        if found_item
            resp.write "#{found_item.price}\n"
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