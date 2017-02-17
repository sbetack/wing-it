use Rack::Static,
  :urls => ["/images", "/js", "/css"],
  :root => "public",
  :index => "home.html"

static_page_mappings = {
  '/' => 'public/home.html',
  '/home.html' => 'public/home.html',
  '/my_wing_its.html' => 'public/my_wing_its.html',
  '/sign_in.html' => 'public/sign_in.html',
  '/create-account.html' => 'public/create-account.html'
}

static_page_mappings.each do |req, file|
  map req do 
    run Proc.new { |env|
      [
        200, 
        {
          'Content-Type'  => 'text/html', 
          'Cache-Control' => 'public, max-age=6400',
        },
        File.open(file, File::RDONLY)
      ]
    }
  end
end