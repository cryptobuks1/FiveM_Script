var prices = {}
var maxes = {}
var zone = null
var itemData = [];

// Partial Functions
function closeMain() {
	$('.shop-container').hide();
}
function openMain() {
	$('.shop-container').show();
}
function closeAll() {
	$('.shop-container').hide();
}
$(".close").click(function(){
	$('.shop-group-items').empty();
    $.post('http://j_shop/quit', JSON.stringify({}));
});
// Listen for NUI Events
window.addEventListener('message', function (event) {

	var item = event.data;

	// Open & Close main window
	if (item.message == "show") {
		if (item.clear == true){
			$( ".home" ).empty();
			prices = {}
			maxes = {}
			zone = null
			$('.shop-group-items').empty();
			itemData = [];
		}
		openMain();
	}

	if (item.message == "hide") {
		closeMain();
	}

	if (item.message == "add"){
		itemData = item.items;
		$.each(item.items, function (k, v) {
			$( ".shop-group-items" ).append(
				`<div class="shop-g-product">
				<div class="shop-g-prd-img">
					<img src="img/`+ v['item'] +`.png" alt="">
				</div>
				<div class="shop-g-prd-name">
				`+ v['label'] +`
				</div>
				<div class="shop-g-price">
				`+ v['price'] +` $
				</div>
				<div class="shop-control">
					<div class="shop-gc-minus">
						<a href="javascript:void(0)" onclick="minusQuatityItems(`+k+`)">
							-
						</a>
					</div>
					<div class="shop-gc-total total_item_`+k+`">1</div>
					<div class="shop-gc-plus">
						<a href="javascript:void(0)" onclick="plusQuatityItems(`+k+`)">
							+
						</a>
					</div>
				</div>
				<div  class="shop-g-btn-buy" onclick="buyItems(`+k+`)">
					ซื้อ
				</div>
			</div>`
			);
		});
		// prices[item.item] = item.price;
		// maxes[item.item] = 99;
		zone = item.loc;
	}
});

function plusQuatityItems(key){
	let value = $('.total_item_'+key).text();
	var newVal = parseFloat(value) + 1;
	$('.total_item_'+key).text("");
	$('.total_item_'+key).text(newVal);
}
function minusQuatityItems(key){
	let value = $('.total_item_'+key).text();
	var newVal = 1;
	if(value > 1){
		var newVal = parseFloat(value) - 1;
	}else{
		newVal = 1;
	}
	$('.total_item_'+key).text("");
	$('.total_item_'+key).text(newVal);
}
function buyItems(key){
	let name_items = itemData[key].item
	let total_bought = $('.total_item_'+key).text();
	console.log('buy',name_items);
	console.log('total buy',total_bought);
	$.post('http://j_shop/purchase', JSON.stringify({
		item: name_items,
		count: total_bought,
		loc: zone
	}));
}

$(".home").on("click", ".btnquantity", function() {

	var $button = $(this);
	var $name = $button.attr('name')
	var oldValue = $button.parent().find(".number").text();
	if ($button.get(0).id == "plus") {
		if (oldValue <  maxes[$name]){
			var newVal = parseFloat(oldValue) + 1;
		}else{
			var newVal = parseFloat(oldValue);
		}
	} else {
	// Don't allow decrementing below zero
		if (oldValue > 1) {
			var newVal = parseFloat(oldValue) - 1;
		} else {
			newVal = 1;
		}
	}
	$button.parent().parent().find(".price").text((prices[$name] * newVal) + "$");
	$button.parent().find(".number").text(newVal);

});


$(".shop-group-items").on("click", ".buy", function() {
	var $button = $(this);
	var $name = $button.attr('name')
	var $count = 1;
	// var $count = parseFloat($button.parent().parent().find(".number").text());
	$.post('http://j_shop/purchase', JSON.stringify({
		item: $name,
		count: 1,
		loc: zone
	}));
});
