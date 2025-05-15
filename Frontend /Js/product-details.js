// product-details.js

const products = [
    {
      id: 1,
      name: "Smart watch",
      price: 1999,
      image: "images/smartwatch.webp",
      description: "Noise colorfit icon 2 combining cutting edge technology with stylish looks, the new ColorFit Icon."
    },
    {
      id: 2,
      name: "Feature Phone",
      price: 1199,
      image: "images/featurephone.webp",
      description: "Basic feature phone with long battery life and FM radio."
    },
    {
      id: 3,
      name: "Wireless Earbuds",
      price: 1299,
      image: "images/earbuds.webp",
      description: "High-quality wireless earbuds with noise cancellation."
    },
    {
      id: 4,
      name: "Smartwatch",
      price: 9999,
      image: "images/smartwatch.webp",
      description: "Latest smartwatch with high-end features and great performance."
    },
    {
      id: 5,
      name: "Winter Hoodie",
      price: 699,
      image: "images/hoodie.webp",
      description: "Warm and stylish hoodie for cold weather."
    },
    {
      id: 6,
      name: "Leather Backpack",
      price: 2799,
      image: "images/backpack.jpeg",
      description: "Spacious leather backpack perfect for travel and college."
    },
    {
      id: 7,
      name: "Women's Kurta",
      price: 999,
      image: "images/kurta.jpeg",
      description: "Elegant and comfortable traditional wear for women."
    },
    {
      id: 8,
      name: "Smart Shoes",
      price: 3299,
      image: "images/shoes.jpeg",
      description: "Smart shoes with excellent grip and comfort."
    },
    {
      id: 9,
      name: "Beauty Kit",
      price: 499,
      image: "images/beautyproducts.jpg",
      description: "Complete beauty kit for skin and hair care."
    },
    {
      id: 10,
      name: "Designer Sunglasses",
      price: 1299,
      image: "images/sunglasses.webp",
      description: "Trendy designer sunglasses for all occasions."
    },
    {
      id: 11,
      name: "Running Shoes",
      price: 2999,
      image: "images/runshoes.jpeg",
      description: "High-performance running shoes with durability."
    },
    {
      id: 12,
      name: "Leather Wallet",
      price: 999,
      image: "images/wallet.jpeg",
      description: "Premium leather wallet with multiple compartments."
    },
    {
      id: 13,
      name: "Bluetooth Speaker",
      price: 1799,
      image: "images/bluetoothspeaker.jpeg",
      description: "Portable Bluetooth speaker with high-quality sound."
    },
    {
      id: 14,
      name: "Perfume",
      price: 1199,
      image: "images/perfume.webp",
      description: "Long-lasting fragrance perfume."
    },
    {
      id: 15,
      name: "Water Bottle",
      price: 799,
      image: "images/waterbottle.jpeg",
      description: "Stylish and durable water bottle."
    },
    {
      id: 16,
      name: "Analog Watch",
      price: 599,
      image: "images/analogwatch.jfif",
      description: "Classic analog watch for daily use."
    },
    {
      id: 17,
      name: "Laptop Backpack",
      price: 1000,
      image: "images/laptopbackpack.jfif",
      description: "Durable backpack with laptop compartment."
    },
    {
      id: 18,
      name: "Men's Kurta",
      price: 1599,
      image: "images/men'skurta.jfif",
      description: "Traditional kurta for men, perfect for festivals."
    },
    {
      id: 19,
      name: "Skincare Kit",
      price: 1599,
      image: "images/skincarekit.jfif",
      description: "Complete skincare kit for glowing skin."
    },
    {
      id: 20,
      name: "Kids Combo Toy Kit",
      price: 1599,
      image: "images/toycombo.jfif",
      description: "Fun and engaging toy combo kit for kids."
    }
  ];
  
  
  // Get Product ID from URL
  const queryString = window.location.search;
  const urlParams = new URLSearchParams(queryString);
  const productId = parseInt(urlParams.get('product'));
  
  // Get product from array
  const product = products.find(p => p.id === productId);
  
  // Populate product details
  if (product) {
    document.getElementById("product-name").innerText = product.name;
    document.getElementById("product-price").innerText = product.price;
    document.getElementById("product-description").innerText = product.description;
    document.getElementById("product-image").src = product.image;
  } else {
    document.querySelector(".product-detail-container").innerHTML = "<p>Product not found!</p>";
  }
  
  
  
 
  
  
  
  
  
  
  
