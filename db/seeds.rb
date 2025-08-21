# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb
# db/seeds.rb

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "Cleaning database..."
Perfume.destroy_all

puts "Preparing perfumes data..."

perfumes_data = [
  {
    name: "No. 5",
    brand: "Chanel",
    category: "Floral Aldehydic",
    description: "Chanel No. 5 is the embodiment of elegance and femininity, a scent that has captivated generations. Its sparkling aldehydic top notes mingle with a lush bouquet of rose, jasmine, and ylang-ylang, grounded in the sensual warmth of sandalwood. Wearing it is like stepping into a timeless, sophisticated world, where every movement leaves a whisper of refinement.",
    style: "Classic, Elegant, Timeless",
    notes: ["Rose", "Jasmine", "Ylang-Ylang", "Sandalwood", "Aldehydes"],
    occasion: "Evening, Special Occasion",
    filename: "chanel_no5.png"
  },
  {
    name: "Rose of No Man’s Land",
    brand: "Byredo",
    category: "Floral",
    description: "Rose of No Man’s Land is a delicate yet audacious floral that celebrates the fearless spirit. Notes of rose, pink pepper, and red berries create a bright, uplifting aroma, perfect for a fragrance connoisseur who delights in subtle strength and charm. Each spray is like a poetic whisper of romance and resilience.",
    style: "Floral, Feminine, Elegant",
    notes: ["Rose", "Pink Pepper", "Red Berries"],
    occasion: "Daytime, Romantic",
    filename: "byredo_rose_of_no_mans_land.png"
  },
  {
    name: "Orphéon",
    brand: "Diptyque",
    category: "Floral Woody",
    description: "Orphéon evokes the mysterious allure of Parisian evenings. With subtle florals intertwined with warm woody notes, it envelops the wearer in a narrative of elegance and urban sophistication. It is both intimate and expansive, capturing the artful charm of a bygone era.",
    style: "Floral Woody, Sophisticated",
    notes: ["Iris", "Violet", "Woody Notes"],
    occasion: "Evening, Casual Chic",
    filename: "diptyque_orpheon.png"
  },
  {
    name: "Valaya",
    brand: "Parfums de Marly",
    category: "Floral Fruity",
    description: "Delina Valaya is an opulent rose composition that dazzles with pink pepper, lychee, and rhubarb, resting upon a soft, musky base. It is a fragrance for the confident, playful connoisseur, inviting admiration while exuding an effortless charm and romance.",
    style: "Floral Fruity, Luxurious",
    notes: ["Rose", "Pink Pepper", "Lychee", "Rhubarb", "Musk"],
    occasion: "Daytime, Special Occasion",
    filename: "pdm_valaya.png"
  },
  {
    name: "Dear Polly",
    brand: "Vilhelm Parfumerie",
    category: "Floral Woody",
    description: "Dear Polly is a contemplative, romantic fragrance blending delicate florals with soft woody undertones. It evokes nostalgia and intimate moments, perfectly suited for those who cherish thoughtful elegance.",
    style: "Floral Woody, Romantic",
    notes: ["Rose", "Violet", "Sandalwood"],
    occasion: "Evening, Special Occasion",
    filename: "dear_polly.png"
  },
  {
    name: "Santal 33",
    brand: "Le Labo",
    category: "Woody",
    description: "Santal 33 is a cult classic, a signature of refinement. Sandalwood, cardamom, and iris combine to produce a meditative, sensual scent that has become synonymous with minimalist luxury and effortless cool.",
    style: "Woody, Minimalist, Unisex",
    notes: ["Sandalwood", "Cardamom", "Iris"],
    occasion: "Daytime, Evening, Unisex",
    filename: "le_labo_santal_33.png"
  },
  {
    name: "Replica Jazz Club",
    brand: "Maison Margiela",
    category: "Oriental Spicy",
    description: "A rich, intoxicating fragrance inspired by smoky jazz clubs. Notes of rum, tobacco, and vanilla create a warm, enveloping aura that evokes nostalgia, intimacy, and elegance.",
    style: "Oriental Spicy, Evening, Warm",
    notes: ["Rum", "Tobacco", "Vanilla"],
    occasion: "Evening, Special Occasion",
    filename: "replica_jazz_club.png"
  },
  {
    name: "Thé Matcha 26",
    brand: "Le Labo",
    category: "Green Tea",
    description: "A meditative fragrance evoking quiet moments of introspection. Creamy fig notes blend with soft vetiver and structured cedar, lifted by a hint of bitter orange. A delicate scent for those close enough to appreciate its subtle charm.",
    style: "Fresh, Green, Aromatic",
    notes: ["Matcha Tea Accord", "Fig", "Vetiver", "Cedar", "Bitter Orange"], # <-- Array
    occasion: "Daytime, Meditative Moments",
    filename: "the_matcha_26.png"
  },
  {
    name: "Thé Yulong",
    brand: "Armani Privé",
    category: "Floral",
    description: "A serene and elegant fragrance that captures the essence of Chinese tea rituals. Jasmine and green tea notes float on a base of soft woods, creating a refined and contemplative aura.",
    style: "Elegant, Floral, Green",
    notes: ["Jasmine", "Green Tea", "Soft Woods"], # <-- Array
    occasion: "Formal Events, Afternoon Tea",
    filename: "the_yulong.png"
  },
  {
    name: "When the Rain Stops",
    brand: "Maison Margiela",
    category: "Fresh",
    description: "A crisp, rainy-day scent that evokes the calm after a storm. Wet petals, airy moss, and subtle aquatic notes mingle for a refreshing and tranquil experience.",
    style: "Fresh, Aquatic",
    notes: ["Wet Petals", "Moss", "Aqua Notes"], # <-- Array
    occasion: "Casual, Everyday",
    filename: "when_the_rain_stops.png"
  },
  {
    name: "Les Jardins Français",
    brand: "Buly",
    category: "Herbal Floral",
    description: "A playful herbal bouquet combining the sharpness of watercress with the green freshness of Sardinian parsley. Bright, lively, and uplifting.",
    style: "Herbal, Fresh, Green",
    notes: ["Watercress", "Parsley", "Green Leaves"],
    occasion: "Daytime, Spring & Summer",
    filename: "cresson_persil.png"
  },
  {
    name: "Naked Dance",
    brand: "Oddity",
    category: "Floral Oriental",
    description: "A sensual and mysterious scent with floral heart notes floating over a warm amber and vanilla base. Evokes intimate evening moments.",
    style: "Sensual, Warm, Floral",
    notes: ["Jasmine", "Amber", "Vanilla"],
    occasion: "Evening, Romantic",
    filename: "naked_dance.png"
  },
  {
    name: "Little Flower",
    brand: "Régime des Fleurs",
    category: "Floral",
    description: "A delicate, vintage-inspired bouquet that captures the charm of a secret garden. Light, airy, and irresistibly feminine.",
    style: "Soft, Floral, Romantic",
    notes: ["Rose", "Lily", "Peony", "Green Accord"],
    occasion: "Daytime, Spring",
    filename: "little_flower.png"
  },
  {
    name: "Casa Blanca",
    brand: "House of Bo",
    category: "Floral",
    description: "A bright and cheerful fragrance inspired by blooming Casablanca lilies. Juicy and green, ideal for uplifting the spirit.",
    style: "Bright, Floral, Green",
    notes: ["Casablanca Lily", "Green Notes", "Citrus"],
    occasion: "Daytime, Casual",
    filename: "casa_blanca_bo.png"
  },
  {
    name: "Father Figure",
    brand: "Phlur",
    category: "Woody Aromatic",
    description: "A modern, minimalist scent balancing soft woods with fresh citrus and aromatic herbs. Clean yet bold.",
    style: "Clean, Woody, Aromatic",
    notes: ["Cedar", "Vetiver", "Bergamot", "Aromatic Herbs"],
    occasion: "Everyday, Office",
    filename: "father_figure.png"
  },
  {
    name: "Tabacco Toscano",
    brand: "Santa Maria Novella",
    category: "Oriental Woody",
    description: "A warm and sophisticated fragrance with rich tobacco leaf accents. Elegant and mature, perfect for contemplative moments.",
    style: "Warm, Oriental, Woody",
    notes: ["Tobacco", "Leather", "Spices", "Wood"],
    occasion: "Evening, Formal",
    filename: "tabacco_toscano.png"
  },
  {
    name: "Into This World",
    brand: "Liis",
    category: "Floral Fruity",
    description: "A poetic fragrance weaving soft fruits with gentle florals, evoking a sense of wonder and exploration.",
    style: "Fruity, Floral, Dreamy",
    notes: ["Peach", "Rose", "Lychee", "Jasmine"],
    occasion: "Casual, Daytime",
    filename: "liis_into_this_world.png"
  },
  {
    name: "Rock River Melody",
    brand: "Régime des Fleurs",
    category: "Woody Floral",
    description: "A harmonious composition blending riverine woods with gentle florals. Evokes serenity and connection with nature.",
    style: "Woody, Floral, Serene",
    notes: ["Cedar", "Sandalwood", "Jasmine", "Lily"],
    occasion: "Daytime, Nature Walks",
    filename: "rock_river_melody.png"
  },
  {
    name: "White Rice",
    brand: "D'Annam",
    category: "Green",
    description: "A minimalist, clean scent reminiscent of fresh rice fields. Crisp, simple, and meditative.",
    style: "Minimalist, Green, Fresh",
    notes: ["Rice", "Green Leaves", "Light Musk"],
    occasion: "Everyday, Casual",
    filename: "white_rice.png"
  },
  {
    name: "Sand and Skin",
    brand: "Floraïku",
    category: "Woody Aquatic",
    description: "A delicate combination of oceanic notes and warm sandy undertones. Evokes summer beaches and gentle caresses of sun-warmed skin.",
    style: "Fresh, Woody, Aquatic",
    notes: ["Sea Notes", "Sand Accord", "Driftwood"],
    occasion: "Summer, Beach",
    filename: "sand_and_skin.png"
  },
  {
    name: "Hotel Cotton",
    brand: "Villa Erbatium",
    category: "Fresh Floral",
    description: "A soft, comforting floral scent with cotton blossom and gentle powdery notes. Perfect for cozy mornings or a relaxed day.",
    style: "Soft, Floral, Cozy",
    notes: ["Cotton Blossom", "White Flowers", "Powdery Musk"],
    occasion: "Daytime, Casual",
    filename: "hotel_cotton.png"
  },
  {
    name: "Delulu",
    brand: ".Oddity",
    category: "Floral Gourmand",
    description: "A playful, slightly sweet floral fragrance with hints of confectionery and warm woods. Evokes whimsy and lighthearted mischief.",
    style: "Playful, Sweet, Floral",
    notes: ["Rose", "Vanilla", "Amber", "Musk"],
    occasion: "Evening, Casual",
    filename: "delulu.png"
  },
  {
    name: "5 o'clock Gingembre",
    brand: "Serge Lutens",
    category: "Spicy Woody",
    description: "A vibrant fragrance combining the warmth of ginger with a woody base, perfect for afternoon tea moments. Elegant, refined, and slightly spicy.",
    style: "Spicy, Woody, Elegant",
    notes: ["Ginger", "Woods", "Citrus", "Musk"],
    occasion: "Afternoon, Elegant",
    filename: "5_oclock_gingembre.png"
  }
]

puts "Seeding perfumes..."

perfumes_data.each do |data|
  perfume = Perfume.create!(
    name: data[:name],
    brand: data[:brand],
    category: data[:category],
    description: data[:description],
    style: data[:style],
    notes: data[:notes],
    occasion: data[:occasion]
  )

  # attaches images with active storage
  file_path = Rails.root.join("app/assets/images/perfumes", data[:filename])
  if File.exist?(file_path)
    perfume.photo.attach(io: File.open(file_path), filename: data[:filename])
  else
    puts "⚠️ File not found: #{data[:filename]}"
  end
end

puts "Seeding completed! #{Perfume.count} perfumes in DB ✅"
