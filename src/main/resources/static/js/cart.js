function addToCart(type, id) {
        //alert("added" + type + id);
        axios({
        method: 'post',
        url: '/addtocart/' + type + '/' + id,
        data: {}
        });
}
function removeFromCart(type, id) {
    //alert("removed" + type + id);
    axios({
    method: 'post',
    url: '/removefromcart/' + type + '/' + id,
    data: {}
    });
}
