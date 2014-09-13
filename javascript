// Generate random integer in [low, high)
// http://blog.tompawlak.org/how-to-generate-random-values-nodejs-javascript
function randomInt (low, high) {
    return Math.floor(Math.random() * (high - low) + low);
}