const resourceName = 'j_inventory';
var itemData = [];
var slot_item = [];
let value = 0;
var keyIndex = 0;
var images = { 
	bread:'bread',
	green_phone:'green_phone',
	money:'money',
	water:'water',
	white_phone:'white_phone',
	yellow_phone:'yellow_phone',
	skin_4_0:'skin_4_0',
}

$(function () {
	window.onload = (e) => {
		window.addEventListener('message', (event) => {
			var item = event.data;
			if (item !== undefined && item.type === "ui") {
				if (item.display === true) {
					$("#container").show();
					let counter = 0
					let sumWeight = 0.0
					$('#inventory-body').empty();
					itemData = item.items;
					$.each(item.items, function (k, v) {
						if (v['weight'] !== undefined) {
							sumWeight += (v['weight'] * v['count']);
						}
						let item_type = v['item_type']?v['item_type']:'none';
						let image = images[v['name']]?images[v['name']]:undefined;
						if(image){
							$("#inventory-body").append(
								`<div class="invontory-grid-item menu-data-` + k + ` item-type-` + item_type + `" oncontextmenu="itemClick(` + k + `)" data-name="` + v['name'] + `" data-count="` + v['count'] + `">
								<div class="invontory-grid-body">
									<div class="inventory-grid-item-img">
										<img src="img/`+ image + `.png" alt="">
									</div>
									<div class="inventory-gird-item-name">
									`+ v['name'] + `
									</div>
									<div class="inventory-gird-item-weight">
									`+ v['count'] + `
									</div>
									<div class="inventory-grid-menu-dropdown">
										<div class="inventory-gm-dropdown-items" onclick="itemUse(`+ k + `)">
											ใช้
										</div>
										<div class="inventory-gm-dropdown-items" onclick="itemGive(`+ k + `)">
											มอบให้
										</div>
										<div class="inventory-gm-dropdown-items" onclick="itemDrop(`+ k + `)">
											ทิ้ง
										</div>
									</div>
								</div>
							</div>`)
							counter++
						}
					});
					dragDrop();
					$("#slot-inventory").html(counter + '/' + '47')
					$("#sum-weight").html(sumWeight + '/' + '40')

				} else {
					$("#container").hide();
				}
			}else if(item !== undefined && item.option === "remove_slot"){
				console.log('item remove',JSON.stringify(item));
				removeItem(item.key);
			}
		});
	};
});

function itemClick(index) {
	unActiveDropDown();
	activeDropDown(index);
}

function activeDropDown(index) {
	$('.menu-data-' + index).addClass('active');
}
function unActiveDropDown() {
	$('.invontory-grid-item').removeClass('active');
}

function itemUse(index) {
	console.log('usable', itemData[index]["usable"])
	if (itemData[index]["usable"]) {
		console.log('name', itemData[index]["name"])

		$.post("https://" + resourceName + "/UseItem", JSON.stringify({
			item: itemData[index]
		}));
	}
	unActiveDropDown();
}
function itemGive(index) {
	keyIndex = index
	toggleGive();
	unActiveDropDown();
}


function toggleGive() {
	$('.inventory-give').toggleClass('active');
}

function submitGive() {
	toggleGive();
	value = $('#giveInput').val();
	if (itemData[keyIndex] == undefined || itemData[keyIndex]["canRemove"] == undefined) {
		return;
	}

	if (itemData[keyIndex]["canRemove"]) {
		console.log('itemGive', keyIndex)
		$.post("https://" + resourceName + "/GetNearPlayers", JSON.stringify({
			count: value,
			item: itemData[keyIndex]
		}));
	}
	console.log('val', value);
}

function itemDrop(index) {
	console.log('itemDrop', index)
	if (itemData[index] == undefined || itemData[index]["canRemove"] == undefined) {
		return;
	}

	if (itemData[index]["canRemove"]) {
		$.post("https://" + resourceName + "/DropItem", JSON.stringify({
			item: itemData[index],
			number: 1
		}));
	}
	unActiveDropDown();
}
function dragDrop() {

	// drag to slot
	var $inventory = $("#inventory-body");
	$slot1 = $(".inventory-slot-item-1");
	$slot2 = $(".inventory-slot-item-2");
	$slot3 = $(".inventory-slot-item-3");
	$slot4 = $(".inventory-slot-item-4");
	$slot5 = $(".inventory-slot-item-5");
	$slot_trousers = $("#trousers");
	$(".invontory-grid-item", $inventory).draggable({
		cancel: "a.ui-icon", // clicking an icon won't initiate dragging
		revert: "invalid", // when not dropped, the item will revert back to its initial position
		containment: "document",
		helper: "clone",
		cursor: "move"
	});
	$slot1.droppable({
		accept: "#inventory-body > .item-type-none",
		classes: {
			"ui-droppable-active": "ui-state-highlight"
		},
		drop: function (event, ui) {
			dropInSlot(ui.draggable, 1);
		}
	});
	$slot2.droppable({
		accept: "#inventory-body > .item-type-none",
		classes: {
			"ui-droppable-active": "ui-state-highlight"
		},
		drop: function (event, ui) {
			dropInSlot(ui.draggable, 2);
		}
	});
	$slot3.droppable({
		accept: "#inventory-body > .item-type-none",
		classes: {
			"ui-droppable-active": "ui-state-highlight"
		},
		drop: function (event, ui) {
			dropInSlot(ui.draggable, 3);
		}
	});
	$slot4.droppable({
		accept: "#inventory-body > .item-type-none",
		classes: {
			"ui-droppable-active": "ui-state-highlight"
		},
		drop: function (event, ui) {
			dropInSlot(ui.draggable, 4);
		}
	});
	$slot5.droppable({
		accept: "#inventory-body > .item-type-none",
		classes: {
			"ui-droppable-active": "ui-state-highlight"
		},
		drop: function (event, ui) {
			dropInSlot(ui.draggable, 5);
		}
	});
	$slot_trousers.droppable({
		accept: "#inventory-body > .item-type-trousers",
		classes: {
			"ui-droppable-active": "ui-state-highlight"
		},
		drop: function (event, ui) {
			dropInSlotClothes(ui.draggable, "trousers");
		}
	});

	// drag to bag
	$bag = $(".inventory-height");
	let slot;
	$(".slot-items").draggable({
		cancel: "a.ui-icon", // clicking an icon won't initiate dragging
		revert: "invalid", // when not dropped, the item will revert back to its initial position
		containment: "document",
		helper: "clone",
		cursor: "move",
		drag: function( event, ui ) {
			slot = ($(this).data('slot'));
		}
	});
	$bag.droppable({
		accept: ".slot-items",
		classes: {
			"ui-droppable-active": "ui-state-highlight"
		},
		drop: function (event, ui) {
			removeItem(slot);
		}
	});
}

function dropInSlot($item, k) {
	var item_name = $item.data("name");
	var item_count = $item.data("count");
	setItem(item_name, k, item_count)
}
function dropInSlotClothes($item, k) {
	var item_name = $item.data("name");
	var item_count = $item.data("count");
	setItemClothes(item_name, k, item_count)
}

function setItem(name, key, count) {
	var t = $('#slot-' + key);
	t.addClass('active');
	var img = t.children('img');
	var name_pic = 'img/' + name + '.png';
	img.attr('src', name_pic);
	$.post("https://" + resourceName + "/setItemSlot", JSON.stringify({
		data:{ name,count },
		key
	}));
}
function setItemClothes(name, key, count) {
	var t = $('#slot-' + key);
	t.addClass('active');
	var img = t.children('img');
	var name_pic = 'img/' + name + '.png';
	img.attr('src', name_pic);
	let dados = 4;
	let tipo = 0;
	$.post("https://" + resourceName + "/setItemSlot", JSON.stringify({
		data:{ name,count },
		key,
		name
	}));
	$.post("https://j_skinshop/update", JSON.stringify([dados, tipo]));
}
function removeItem(key) {
	var t = $('#slot-' + key);
	t.removeClass('active');
	$.post("https://" + resourceName + "/removeItemSlot", JSON.stringify({
		key
	}));
}