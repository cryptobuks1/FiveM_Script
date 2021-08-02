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
					$.each(item.items, function (k, v) {
						// console.log(v['weight']);
						if (v['weight'] !== undefined) {
							sumWeight += (v['weight'] * v['count']);
						}
						$("#inventory-body").append(
							`<div class="invontory-grid-item">
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
							</div>
						</div>`
						)
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