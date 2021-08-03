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
							`<div class="invontory-grid-item menu-data-` + k + `" oncontextmenu="itemClick(` + k + `)">
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
	unAct
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