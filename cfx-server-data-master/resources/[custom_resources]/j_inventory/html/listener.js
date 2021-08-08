const resourceName = 'j_inventory';
var itemData = [];

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
						// console.log(v['weight']);
						if (v['weight'] !== undefined) {
							sumWeight += (v['weight'] * v['count']);
						}
						$("#inventory-body").append(
							`<div class="invontory-grid-item menu-data-` + k + `" oncontextmenu="itemClick(` + k + `)" data-name="`+ v['name'] + `">
							<div class="invontory-grid-body">
								<div class="inventory-grid-item-img">
									<img src="img/`+ v['name'] + `.png" alt="">
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

						// )$("#inventory-body").append(
						// 	`<div class="invontory-grid-item">
						// 	<div class="invontory-grid-body">
						// 		<div class="inventory-grid-item-img">
						// 			<img src="img/`+ v['name'] + `.png" alt="">
						// 		</div>
						// 		<div class="inventory-gird-item-name">
						// 		`+ v['name'] + `
						// 		</div>
						// 		<div class="inventory-gird-item-weight">
						// 		`+ v['count'] + `
						// 		</div>
						// 	</div>
						// </div>`
						// )
						counter++
					});
					dragDrop();
					$("#slot-inventory").html(counter + '/' + '47')
					$("#sum-weight").html(sumWeight + '/' + '40')

				} else {
					$("#container").hide();
				}
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
	console.log('itemGive', index)
	if (itemData[index] == undefined || itemData[index]["canRemove"] == undefined) {
		return;
	}

	if (itemData[index]["canRemove"]) {
		// $.post("https://" + resourceName + "/GiveItem", JSON.stringify({
		// 	player: player,
        //     item: itemData[index],
        //     number: parseInt($("#count").val())
		// }));
	}
	unActiveDropDown();
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
function dragDrop(){
	var $inventory = $( "#inventory-body" ),
	$slot1 = $( ".inventory-slot-item-1" );
	$slot2 = $( ".inventory-slot-item-2" );
	$slot3 = $( ".inventory-slot-item-3" );
	$slot4 = $( ".inventory-slot-item-4" );
	$slot5 = $( ".inventory-slot-item-5" );

	$( ".invontory-grid-item", $inventory ).draggable({
		cancel: "a.ui-icon", // clicking an icon won't initiate dragging
		revert: "invalid", // when not dropped, the item will revert back to its initial position
		containment: "document",
		helper: "clone",
		cursor: "move"
	});
	$slot1.droppable({
		accept: "#inventory-body > .invontory-grid-item",
		classes: {
		  "ui-droppable-active": "ui-state-highlight"
		},
		drop: function( event, ui ) {
		  	dropInSlot( ui.draggable,1 );
		}
	});
	$slot2.droppable({
		accept: "#inventory-body > .invontory-grid-item",
		classes: {
		  "ui-droppable-active": "ui-state-highlight"
		},
		drop: function( event, ui ) {
		  	dropInSlot( ui.draggable,2 );
		}
	});
	$slot3.droppable({
		accept: "#inventory-body > .invontory-grid-item",
		classes: {
		  "ui-droppable-active": "ui-state-highlight"
		},
		drop: function( event, ui ) {
		  	dropInSlot( ui.draggable,3 );
		}
	});
	$slot4.droppable({
		accept: "#inventory-body > .invontory-grid-item",
		classes: {
		  "ui-droppable-active": "ui-state-highlight"
		},
		drop: function( event, ui ) {
		  	dropInSlot( ui.draggable,4 );
		}
	});
	$slot5.droppable({
		accept: "#inventory-body > .invontory-grid-item",
		classes: {
		  "ui-droppable-active": "ui-state-highlight"
		},
		drop: function( event, ui ) {
		  	dropInSlot( ui.draggable,5 );
		}
	});
}

function dropInSlot( $item,k ) {
	var item_name = $item.data("name");
	setItem(item_name,k)
}

function setItem(name,key){
	var t = $('#slot-'+key);
	t.addClass('active');
	var img = t.children('img');
	var name_pic = 'img/'+name+'.png';
	console.log('name_pic',name_pic);
	img.attr('src',name_pic);
}