for i in 1..100 do
  p = Product.new
  p.title = "Ksiazka #{i}"
  p.price = rand(100)+10
  p.description = "Opis ksiazki nr #{i}"
  p.image_url = 'mops.jpg'
  p.save
end