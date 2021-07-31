$(function () {
	window.onload = (e) => {
		/* 'links' the js with the Nui message from main.lua */
		window.addEventListener('message', (event) => {
			//document.querySelector("#logo").innerHTML = " "
			var item = event.data;
			if (item !== undefined && item.type === "ui") {
				/* if the display is true, it will show */
				if (item.display === true) {
					$("#container").show();
					$("#id_users").html(item._id);
					$("#type_users").html(item.type);
					$("#playerX").html(parseFloat(item.picasso["playerX"]).toFixed(2));
					$("#playerY").html(parseFloat(item.picasso["playerY"]).toFixed(2));
					$("#playerZ").html(parseFloat(item.picasso["playerZ"]).toFixed(2));
					$("#playerH").html(parseFloat(item.picasso["playerH"]).toFixed(2));
					/* if the display is false, it will hide */
				} else {
					$("#container").hide();
				}
			}
		});
	};
});