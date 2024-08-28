# flutter_demo_app

## Setup
## Get the project from the repo

get the repo from the given below url and and checkout to main branch.

```
git remote add origin https://gitlab.dewsolutions.in/lalitp/flutter_demo_app.git
```
## Getting started

for initial setup go to https://mocki.io and create the api key using below json response

Copy api key and replace with the app constant named apiKey in ApiEndpoints class. 

```
{
"status": "ok",
"code": 200,
"data": [
{
"name": "Smartphone Pro",
"price": 999.99,
"image": "mobile-phone.jpg",
"description": "A premium smartphone with 128GB storage and a 48MP camera."
},
{
"name": "Wireless Headphones",
"price": 199.99,
"image": "headphones.jpg",
"description": "Noise-cancelling wireless headphones with 20 hours of battery life."
},
{
"name": "Smartwatch Series 5",
"price": 299.99,
"image": "smart-watch.jpg",
"description": "A smartwatch with fitness tracking and GPS functionality."
},
{
"name": "Laptop X200",
"price": 1299.99,
"image": "computer.jpg",
"description": "A powerful laptop with a 15.6-inch display and 16GB RAM."
},
{
"name": "Bluetooth Speaker",
"price": 49.99,
"image": "bluetooth.jpg",
"description": "Portable Bluetooth speaker with deep bass and 12-hour battery."
},
{
"name": "4K LED TV",
"price": 599.99,
"image": "tv-set.jpg",
"description": "55-inch 4K Ultra HD LED TV with smart features and HDR support."
}
]
}
```

## Good to go to run the project
## Usage instruction

1. Open app with products page where user can scroll the list of products cards. Product cards has
option to add to cart.
2. Tapping on any product card beyond add to cart button app will navigate to product details page
where product detail i.e. image, name, description, price is visible with option to add to cart 
option.
3. Tapping on Add to cart button, item will be added to cart and number icon over cart icon will be
updated.
4. Tapping on cart icon over products and product details screen navigate to cart screen.
5. Cart screen have the details of all items added into cart with the total price.
6. On cart screen product card have the option to remove product. 
7. Removing product on the cart item list will update the total price at the same time




