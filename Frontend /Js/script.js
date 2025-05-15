function loadProduct(productId) {
  const product = products[productId];
  if (product) {
      document.getElementById("product-image").src = product.image;
      document.getElementById("product-name").innerText = product.name;
      document.getElementById("product-description").innerText = product.description;
      document.getElementById("product-brand").innerText = product.brand;
      document.getElementById("product-category").innerText = product.category;
      document.getElementById("product-color").innerText = product.color;
      document.getElementById("product-sku").innerText = product.sku;
      document.getElementById("product-price").innerText = product.price;

      // Handle Add to Cart
      document.querySelector(".btn").addEventListener("click", function () {
          addToCart(productId);
      });
  } else {
      document.querySelector(".product-container").innerHTML = "<h2>Product Not Found</h2>";
  }
}

function addToCart(productId) {
    let cart = JSON.parse(localStorage.getItem("cart")) || [];
    let product = products.find(p => p.id === parseInt(productId));
  
    if (!product) return;
  
    let existingProduct = cart.find(item => item.id === product.id);
    if (existingProduct) {
      existingProduct.quantity += 1;
    } else {
      cart.push({ ...product, quantity: 1 });
    }
  
    localStorage.setItem("cart", JSON.stringify(cart));
    alert("Added to Cart!");
  }
  

//load product function on page load
// Function to load product based on URL parameter
function getProductIdFromURL() {
    const params = new URLSearchParams(window.location.search);
    return params.get("productId");
}

document.addEventListener("DOMContentLoaded", function () {
    const productId = getProductIdFromURL() || "product1"; // fallback
    loadProduct(productId);
});


document.addEventListener("DOMContentLoaded", function () {
  const addToCartBtn = document.getElementById("add-to-cart-btn");

  if (addToCartBtn) {
      addToCartBtn.addEventListener("click", function () {
          let cart = JSON.parse(localStorage.getItem("cart")) || [];

          // Get product details
          const product = {
              name: document.getElementById("product-name").innerText,
              price: parseFloat(document.getElementById("product-price").innerText),
              image: document.getElementById("product-image").src,
              quantity: 1
          };

          // Check if product is already in the cart
          let existingProduct = cart.find(item => item.name === product.name);

          if (existingProduct) {
              existingProduct.quantity += 1; // Increase quantity if already in cart
          } else {
              cart.push(product); // Add new product to cart
          }

          // Save updated cart to localStorage
          localStorage.setItem("cart", JSON.stringify(cart));

          alert("Product added to cart!");
      });
  }
});
