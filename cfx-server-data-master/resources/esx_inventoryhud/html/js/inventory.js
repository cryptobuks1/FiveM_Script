var type = "normal";
var disabled = false;
var disabledFunction = null;

window.addEventListener("message", function (event) {
    if (event.data.action == "display") {
        type = event.data.type
        disabled = false;

        if (type === "normal") {
            $(".info-div").hide();
            document.getElementById("otherInventory").style.width = "0px";
            document.getElementById("playerInventory").style.width = "90%";
            document.getElementById("controls").style.width = "10%";
            document.getElementById("Search").style.width = "300px";
            document.getElementById("Search2").style.width = "0px";
        } else if (type === "trunk") {
            $(".info-div").show();
            document.getElementById("playerInventory").style.width = "45%";
            document.getElementById("otherInventory").style.width = "45%";
            document.getElementById("controls").style.width = "10%";
            document.getElementById("Search").style.width = "100px";
            document.getElementById("Search2").style.width = "100px";
		} else if (type === "vault") {
            $(".info-div").show();
            document.getElementById("playerInventory").style.width = "45%";
            document.getElementById("otherInventory").style.width = "45%";
            document.getElementById("controls").style.width = "10%";
            document.getElementById("Search").style.width = "100px";
            document.getElementById("Search2").style.width = "100px";
        } else if (type === "property") {
            $(".info-div").hide();
            document.getElementById("playerInventory").style.width = "45%";
            document.getElementById("otherInventory").style.width = "45%";
            document.getElementById("controls").style.width = "10%";
            document.getElementById("Search").style.width = "100px";
            document.getElementById("Search2").style.width = "100px";
        } else if (type === "player") {
            $(".info-div").show();
            document.getElementById("playerInventory").style.width = "45%";
            document.getElementById("otherInventory").style.width = "45%";
            document.getElementById("controls").style.width = "10%";
            document.getElementById("Search").style.width = "100px";
            document.getElementById("Search2").style.width = "100px";
        }

        $(".ui").fadeIn();
    } else if (event.data.action == "hide") {
        $("#dialog").dialog("close");
        $(".ui").fadeOut();
        $(".item").remove();
        //$("#otherInventory").html("<div id=\"noSecondInventoryMessage\"></div>");
        //$("#noSecondInventoryMessage").html(invLocale.secondInventoryNotAvailable);
    } else if (event.data.action == "setItems") {

        inventorySetup(event.data.itemList);

        $('.item').contextmenu(function(){
            var dropdowns = document.getElementsByClassName("dd-park");
            var i;
            for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }

            dropcount = $("#count").val();
            $(".useon").html("Use");
            $(".giveon").html("Give");
            $(".dropon").html("Drop");

            indexdd = $(this).data("indexdd");
            mydd = "myDropdown-" + indexdd;
            document.getElementById(mydd).classList.toggle("show");

            if (disabled) {
                return false;
            }
            itemData = $(this).data("item");
            itemInventory = $(this).data("inventory");

            if (itemInventory == "second" || !itemData.canRemove) {
                $(".dropon").hide();
                $(".giveon").hide();
            }
            else{
                $(".dropon").show();
                $(".giveon").show();
            }

            if (itemInventory == "second" || !itemData.usable) {
                $(".useon").hide();
            }
            else{
                $(".useon").show();
            }
        });

        $('.item').click(function(){
            var dropdowns = document.getElementsByClassName("dd-park");
            var i;
            for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }
        });

        $('.useon').click(function(){
            itemData = $(this).data("item");
            itemInventory = $(this).data("inventory");
    
                if (itemData == undefined || itemData.usable == undefined) {
                    return;
                }
    
                if (itemInventory == undefined || itemInventory == "second") {
                    return;
                }
    
                if (itemData.usable) {
                    disableInventory(300);
                    $.post("http://esx_inventoryhud/UseItem", JSON.stringify({
                        item: itemData
                    }));
                }
        });

        $('.slot1').mouseenter(function() {
            var audio = $("#mySoundClip")[0];
            audio.volume = 0.1;
            audio.currentTime = 0.25;
            audio.play();
        });

        $('.giveon').click(function(){
            itemData = $(this).data("item");
            itemInventory = $(this).data("inventory");

            if (itemData == undefined || itemData.canRemove == undefined) {
                return;
            }

            if (itemInventory == undefined || itemInventory == "second") {
                return;
            }

            if (itemData.canRemove) {
                disableInventory(300);
                $.post("http://esx_inventoryhud/GetNearPlayers", JSON.stringify({
                    item: itemData
                }));
            }
        });

        $('.dropon').click(function(){
            Swal.fire({
                title: 'กรอกจำนวน',
                input: 'number',
                inputAttributes: {
                  autocapitalize: 'off'
                },
                showCancelButton: true,
                confirmButtonText: 'OK',
                customClass: 'swal-wide',
                showLoaderOnConfirm: true,
                preConfirm: (login) => {
                    itemData = $(this).data("item");
                    itemInventory = $(this).data("inventory");
        
                    if (itemData == undefined || itemData.canRemove == undefined) {
                        return;
                    }
        
                    if (itemInventory == undefined || itemInventory == "second") {
                        return;
                    }
        
                    if (itemData.canRemove) {
                        disableInventory(300);
                        $.post("http://esx_inventoryhud/DropItem", JSON.stringify({
                            item: itemData,
                            number: parseInt(login)
                        }));
                    }
                },
                allowOutsideClick: () => !Swal.isLoading()
              })
        });

        $('.item').draggable({
            helper: 'clone',
            appendTo: 'body',
            zIndex: 99999,
            revert: 'invalid',
            start: function (event, ui) {
                var dropdowns = document.getElementsByClassName("dd-park");
                var i;
                for (i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                    if (openDropdown.classList.contains('show')) {
                        openDropdown.classList.remove('show');
                    }
                }

                if (disabled) {
                    return false;
                }

                $(this).css('background-image', 'none');
                itemData = $(this).data("item");
                itemInventory = $(this).data("inventory");

                if (itemInventory == "second" || !itemData.canRemove) {
                    $("#drop").addClass("disabled");
                    $("#give").addClass("disabled");
                }

                if (itemInventory == "second" || !itemData.usable) {
                    $("#use").addClass("disabled");
                }
            },
            stop: function () {
                itemData = $(this).data("item");

                if (itemData !== undefined && itemData.name !== undefined) {
                    $(this).css('background-image', 'url(\'img/items/' + itemData.name + '.png\'');
                    $("#drop").removeClass("disabled");
                    $("#use").removeClass("disabled");
                    $("#give").removeClass("disabled");
                }
            }
        });
    } else if (event.data.action == "setSecondInventoryItems") {
        secondInventorySetup(event.data.itemList);
    } else if (event.data.action == "setInfoText") {
        $(".info-div").html(event.data.text);
    } else if (event.data.action == "nearPlayers") {
        $("#nearPlayers").html("");

        $.each(event.data.players, function (index, player) {
            $("#nearPlayers").append('<button class="nearbyPlayerButton" data-player="' + player.player + '">' + player.label + ' (' + player.player + ')</button>');
        });

        $("#dialog").dialog("open");

        $(".nearbyPlayerButton").click(function () {
            Swal.fire({
                title: 'กรอกจำนวน',
                input: 'number',
                inputAttributes: {
                    autocapitalize: 'off'
                },
                showCancelButton: true,
                confirmButtonText: 'OK',
                customClass: 'swal-wide',
                showLoaderOnConfirm: true,
                preConfirm: (login) => {
                    $("#dialog").dialog("close");
                    player = $(this).data("player");
                    $.post("http://esx_inventoryhud/GiveItem", JSON.stringify({
                        player: player,
                        item: event.data.item,
                        number: parseInt(login)
                    }));
                },
                allowOutsideClick: () => !Swal.isLoading()
            })
        });
    }
});

function closeInventory() {
    $.post("http://esx_inventoryhud/NUIFocusOff", JSON.stringify({}));
}

function inventorySetup(items) {
    /*$("#playerInventory").html("");*/
    $("#all").html("");
    $("#money").html("");
    $("#standard").html("");
    $("#weapon").html("");
    $("#canuse").html("");

    $.each(items, function (index, item) {
        count = setCount(item);
        dropcount = $("#count").val();
        if(item.usable == true){
            $("#canuse").append('<div class="slot1"><div class="slot"><div id="item-' + index + '" class="item" style = "background-image: url(\'img/items/' + item.name + '.png\')">' +
            '<div class="item-count">' + count + '</div> <div class="item-name">' + item.label + '</div> </div ><div class="item-name-bg"></div></div> '+
            '<div id="myDropdown-' + index +'" class="dd-park">'+
                '<button id="use-' + index +'" class="useon">Use</button>'+
                '<button id="give-' + index +'" class="giveon">Give</button>'+
                '<button id="drop-' + index +'" class="dropon">Drop</button>'+
            '</div></div>');
            $('#item-' + index).data('item', item);
            $('#item-' + index).data('inventory', "main");
            $('#item-' + index).data('indexdd', index);
            $('#use-' + index).data('item', item);
            $('#use-' + index).data('inventory', "main");
            $('#give-' + index).data('item', item);
            $('#give-' + index).data('inventory', "main");
            $('#drop-' + index).data('item', item);
            $('#drop-' + index).data('inventory', "main");
        }else if(item.type == "item_account" || item.type == "item_money"){
            $("#money").append('<div class="slot1"><div class="slot"><div id="item-' + index + '" class="item" style = "background-image: url(\'img/items/' + item.name + '.png\')">' +
            '<div class="item-count">' + count + '</div> <div class="item-name">' + item.label + '</div> </div ><div class="item-name-bg"></div></div> '+
            '<div id="myDropdown-' + index +'" class="dd-park">'+
                '<button id="use-' + index +'" class="useon">Use</button>'+
                '<button id="give-' + index +'" class="giveon">Give</button>'+
                '<button id="drop-' + index +'" class="dropon">Drop</button>'+
            '</div></div>');
            $('#item-' + index).data('item', item);
            $('#item-' + index).data('inventory', "main");
            $('#item-' + index).data('indexdd', index);
            $('#use-' + index).data('item', item);
            $('#use-' + index).data('inventory', "main");
            $('#give-' + index).data('item', item);
            $('#give-' + index).data('inventory', "main");
            $('#drop-' + index).data('item', item);
            $('#drop-' + index).data('inventory', "main");
        }else if(item.type == "item_standard"){
            $("#standard").append('<div class="slot1"><div class="slot"><div id="item-' + index + '" class="item" style = "background-image: url(\'img/items/' + item.name + '.png\')">' +
            '<div class="item-count">' + count + '</div> <div class="item-name">' + item.label + '</div> </div ><div class="item-name-bg"></div></div> '+
            '<div id="myDropdown-' + index +'" class="dd-park">'+
                '<button id="use-' + index +'" class="useon">Use</button>'+
                '<button id="give-' + index +'" class="giveon">Give</button>'+
                '<button id="drop-' + index +'" class="dropon">Drop</button>'+
            '</div></div>');
            $('#item-' + index).data('item', item);
            $('#item-' + index).data('inventory', "main");
            $('#item-' + index).data('indexdd', index);
            $('#use-' + index).data('item', item);
            $('#use-' + index).data('inventory', "main");
            $('#give-' + index).data('item', item);
            $('#give-' + index).data('inventory', "main");
            $('#drop-' + index).data('item', item);
            $('#drop-' + index).data('inventory', "main");
        }else if(item.type == "item_weapon"){
            $("#weapon").append('<div class="slot1"><div class="slot"><div id="item-' + index + '" class="item" style = "background-image: url(\'img/items/' + item.name + '.png\')">' +
            '<div class="item-count">' + count + '</div> <div class="item-name">' + item.label + '</div> </div ><div class="item-name-bg"></div></div> '+
            '<div id="myDropdown-' + index +'" class="dd-park">'+
                '<button id="use-' + index +'" class="useon">Use</button>'+
                '<button id="give-' + index +'" class="giveon">Give</button>'+
                '<button id="drop-' + index +'" class="dropon">Drop</button>'+
            '</div></div>');
            $('#item-' + index).data('item', item);
            $('#item-' + index).data('inventory', "main");
            $('#item-' + index).data('indexdd', index);
            $('#use-' + index).data('item', item);
            $('#use-' + index).data('inventory', "main");
            $('#give-' + index).data('item', item);
            $('#give-' + index).data('inventory', "main");
            $('#drop-' + index).data('item', item);
            $('#drop-' + index).data('inventory', "main");
        }
        $("#all").append('<div class="slot1"><div class="slot"><div id="item-' + index + '" class="item" style = "background-image: url(\'img/items/' + item.name + '.png\')">' +
        '<div class="item-count">' + count + '</div> <div class="item-name">' + item.label + '</div> </div ><div class="item-name-bg"></div></div> '+
        '<div id="myDropdown-' + index +'" class="dd-park">'+
            '<button id="use-' + index +'" class="useon">Use</button>'+
            '<button id="give-' + index +'" class="giveon">Give</button>'+
            '<button id="drop-' + index +'" class="dropon">Drop</button>'+
        '</div></div>');
        $('#item-' + index).data('item', item);
        $('#item-' + index).data('inventory', "main");
        $('#item-' + index).data('indexdd', index);
        $('#use-' + index).data('item', item);
        $('#use-' + index).data('inventory', "main");
        $('#give-' + index).data('item', item);
        $('#give-' + index).data('inventory', "main");
        $('#drop-' + index).data('item', item);
        $('#drop-' + index).data('inventory', "main");
    });
}

function secondInventorySetup(items) {

    $("#all2").html("");
    $("#money2").html("");
    $("#standard2").html("");
    $("#weapon2").html("");
    $("#canuse2").html("");

    $.each(items, function (index, item) {
        count = setCount(item);
        if(item.usable == true){
            $("#canuse2").append('<div class="slot1"><div class="slot"><div id="itemOther-' + index + '" class="item" style = "background-image: url(\'img/items/' + item.name + '.png\')">' +
            '<div class="item-count">' + count + '</div> <div class="item-name">' + item.label + '</div> </div ><div class="item-name-bg"></div></div> '+
            '<div id="myDropdown-' + index +'" class="dd-park">'+
                '<button id="use-' + index +'" class="useon">Use</button>'+
                '<button id="give-' + index +'" class="giveon">Give</button>'+
                '<button id="drop-' + index +'" class="dropon">Drop</button>'+
            '</div></div>');
            $('#itemOther-' + index).data('item', item);
            $('#itemOther-' + index).data('inventory', "second");
            $('#itemOther-' + index).data('indexdd', index);
            $('#use-' + index).data('item', item);
            $('#use-' + index).data('inventory', "second");
            $('#give-' + index).data('item', item);
            $('#give-' + index).data('inventory', "second");
            $('#drop-' + index).data('item', item);
            $('#drop-' + index).data('inventory', "second");
        }else if(item.type == "item_account" || item.type == "item_money"){
            $("#money2").append('<div class="slot1"><div class="slot"><div id="itemOther-' + index + '" class="item" style = "background-image: url(\'img/items/' + item.name + '.png\')">' +
            '<div class="item-count">' + count + '</div> <div class="item-name">' + item.label + '</div> </div ><div class="item-name-bg"></div></div> '+
            '<div id="myDropdown-' + index +'" class="dd-park">'+
                '<button id="use-' + index +'" class="useon">Use</button>'+
                '<button id="give-' + index +'" class="giveon">Give</button>'+
                '<button id="drop-' + index +'" class="dropon">Drop</button>'+
            '</div></div>');
            $('#itemOther-' + index).data('item', item);
            $('#itemOther-' + index).data('inventory', "second");
            $('#itemOther-' + index).data('indexdd', index);
            $('#use-' + index).data('item', item);
            $('#use-' + index).data('inventory', "second");
            $('#give-' + index).data('item', item);
            $('#give-' + index).data('inventory', "second");
            $('#drop-' + index).data('item', item);
            $('#drop-' + index).data('inventory', "second");
        }else if(item.type == "item_standard"){
            $("#standard2").append('<div class="slot1"><div class="slot"><div id="itemOther-' + index + '" class="item" style = "background-image: url(\'img/items/' + item.name + '.png\')">' +
            '<div class="item-count">' + count + '</div> <div class="item-name">' + item.label + '</div> </div ><div class="item-name-bg"></div></div> '+
            '<div id="myDropdown-' + index +'" class="dd-park">'+
                '<button id="use-' + index +'" class="useon">Use</button>'+
                '<button id="give-' + index +'" class="giveon">Give</button>'+
                '<button id="drop-' + index +'" class="dropon">Drop</button>'+
            '</div></div>');
            $('#itemOther-' + index).data('item', item);
            $('#itemOther-' + index).data('inventory', "second");
            $('#itemOther-' + index).data('indexdd', index);
            $('#use-' + index).data('item', item);
            $('#use-' + index).data('inventory', "second");
            $('#give-' + index).data('item', item);
            $('#give-' + index).data('inventory', "second");
            $('#drop-' + index).data('item', item);
            $('#drop-' + index).data('inventory', "second");
        }else if(item.type == "item_weapon"){
            $("#weapon2").append('<div class="slot1"><div class="slot"><div id="itemOther-' + index + '" class="item" style = "background-image: url(\'img/items/' + item.name + '.png\')">' +
            '<div class="item-count">' + count + '</div> <div class="item-name">' + item.label + '</div> </div ><div class="item-name-bg"></div></div> '+
            '<div id="myDropdown-' + index +'" class="dd-park">'+
                '<button id="use-' + index +'" class="useon">Use</button>'+
                '<button id="give-' + index +'" class="giveon">Give</button>'+
                '<button id="drop-' + index +'" class="dropon">Drop</button>'+
            '</div></div>');
            $('#itemOther-' + index).data('item', item);
            $('#itemOther-' + index).data('inventory', "second");
            $('#itemOther-' + index).data('indexdd', index);
            $('#use-' + index).data('item', item);
            $('#use-' + index).data('inventory', "second");
            $('#give-' + index).data('item', item);
            $('#give-' + index).data('inventory', "second");
            $('#drop-' + index).data('item', item);
            $('#drop-' + index).data('inventory', "second");
        }
        $("#all2").append('<div class="slot1"><div class="slot"><div id="itemOther-' + index + '" class="item" style = "background-image: url(\'img/items/' + item.name + '.png\')">' +
        '<div class="item-count">' + count + '</div> <div class="item-name">' + item.label + '</div> </div ><div class="item-name-bg"></div></div> '+
        '<div id="myDropdown-' + index +'" class="dd-park">'+
            '<button id="use-' + index +'" class="useon">Use</button>'+
            '<button id="give-' + index +'" class="giveon">Give</button>'+
            '<button id="drop-' + index +'" class="dropon">Drop</button>'+
        '</div></div>');
        $('#itemOther-' + index).data('item', item);
        $('#itemOther-' + index).data('inventory', "second");
        $('#itemOther-' + index).data('indexdd', index);
        $('#use-' + index).data('item', item);
        $('#use-' + index).data('inventory', "second");
        $('#give-' + index).data('item', item);
        $('#give-' + index).data('inventory', "second");
        $('#drop-' + index).data('item', item);
        $('#drop-' + index).data('inventory', "second");
    });
}

function Interval(time) {
    var timer = false;
    this.start = function () {
        if (this.isRunning()) {
            clearInterval(timer);
            timer = false;
        }

        timer = setInterval(function () {
            disabled = false;
        }, time);
    };
    this.stop = function () {
        clearInterval(timer);
        timer = false;
    };
    this.isRunning = function () {
        return timer !== false;
    };
}

function disableInventory(ms) {
    disabled = true;

    if (disabledFunction === null) {
        disabledFunction = new Interval(ms);
        disabledFunction.start();
    } else {
        if (disabledFunction.isRunning()) {
            disabledFunction.stop();
        }

        disabledFunction.start();
    }
}

function setCount(item) {
    count = '<span class="item-count-box">' + item.count + '</span>';

    if (item.limit > 0) {
        //count = item.count + " / " + item.limit
        count = '<span class="item-count-box">' + item.count + '</span> <span class="item-count-box2">' + item.limit + '</span>';
    }

    if (item.type === "item_weapon") {
        if (count == 0) {
            count = "";
        } else {
            //count = '<img src="img/bullet.png" class="ammoIcon"> ' + item.count;
            count = '<span class="item-count-box4"><img src="img/bullet.png" class="ammoIcon"> ' + item.count+ '</span>';
        }
    }

    if (item.type === "item_money") {
        //count = formatMoney(item.count);
        count = '<span class="item-count-box3">' + formatMoney(item.count)+'</span>';
    }
    if (item.type === "item_account") {
        //count = formatMoney(item.count);
        count = '<span class="item-count-box5">' + formatMoney(item.count)+'</span>';
    }

    return count;
}

function formatMoney(n, c, d, t) {
    var c = isNaN(c = Math.abs(c)) ? 2 : c,
        d = d == undefined ? "." : d,
        t = t == undefined ? "," : t,
        s = n < 0 ? "-" : "",
        i = String(parseInt(n = Math.abs(Number(n) || 0).toFixed(c))),
        j = (j = i.length) > 3 ? j % 3 : 0;

    return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t);
};

$(document).ready(function () {
    $("#count").focus(function () {
        $(this).val("")
    }).blur(function () {
        if ($(this).val() == "") {
            $(this).val("1")
        }
    });

    $("body").on("keyup", function (key) {
        if (Config.closeKeys.includes(key.which)) {
            closeInventory();
        }
    });

    $('#use').droppable({
        hoverClass: 'hoverControl',
        drop: function (event, ui) {
            itemData = ui.draggable.data("item");

            if (itemData == undefined || itemData.usable == undefined) {
                return;
            }

            itemInventory = ui.draggable.data("inventory");

            if (itemInventory == undefined || itemInventory == "second") {
                return;
            }

            if (itemData.usable) {
                disableInventory(300);
                $.post("http://esx_inventoryhud/UseItem", JSON.stringify({
                    item: itemData
                }));
            }
        }
    });

    $('#give').droppable({
        hoverClass: 'hoverControl',
        drop: function (event, ui) {
            itemData = ui.draggable.data("item");

            if (itemData == undefined || itemData.canRemove == undefined) {
                return;
            }

            itemInventory = ui.draggable.data("inventory");

            if (itemInventory == undefined || itemInventory == "second") {
                return;
            }

            if (itemData.canRemove) {
                disableInventory(300);
                $.post("http://esx_inventoryhud/GetNearPlayers", JSON.stringify({
                    item: itemData
                }));
            }
        }
    });

    $('#drop').droppable({
        hoverClass: 'hoverControl',
        drop: function (event, ui) {
        Swal.fire({
            title: 'กรอกจำนวน',
            input: 'number',
            inputAttributes: {
                autocapitalize: 'off'
            },
            showCancelButton: true,
            confirmButtonText: 'OK',
            customClass: 'swal-wide',
            showLoaderOnConfirm: true,
            preConfirm: (login) => {
                itemData = ui.draggable.data("item");
                itemInventory = ui.draggable.data("inventory");
    
                if (itemData == undefined || itemData.canRemove == undefined) {
                    return;
                }
    
                if (itemInventory == undefined || itemInventory == "second") {
                    return;
                }
    
                if (itemData.canRemove) {
                    disableInventory(300);
                    $.post("http://esx_inventoryhud/DropItem", JSON.stringify({
                        item: itemData,
                        number: parseInt(login)
                    }));
                }
            },
            allowOutsideClick: () => !Swal.isLoading()
            })
        }
    });

    $('#playerInventory').droppable({
        drop: function (event, ui) {
            itemData = ui.draggable.data("item");
            itemInventory = ui.draggable.data("inventory");

            if (type === "trunk" && itemInventory === "second") {
                Swal.fire({
                    title: 'กรอกจำนวน',
                    input: 'number',
                    inputAttributes: {
                        autocapitalize: 'off'
                    },
                    showCancelButton: true,
                    confirmButtonText: 'OK',
                    customClass: 'swal-wide',
                    showLoaderOnConfirm: true,
                    preConfirm: (login) => {
                        
                        disableInventory(500);
                        $.post("http://esx_inventoryhud/TakeFromTrunk", JSON.stringify({
                            item: itemData,
                            number: parseInt(login)
                        }));
                    },
                allowOutsideClick: () => !Swal.isLoading()
                })
            } else if (type === "property" && itemInventory === "second") {
                Swal.fire({
                    title: 'กรอกจำนวน',
                    input: 'number',
                    inputAttributes: {
                        autocapitalize: 'off'
                    },
                    showCancelButton: true,
                    confirmButtonText: 'OK',
                    customClass: 'swal-wide',
                    showLoaderOnConfirm: true,
                    preConfirm: (login) => {
                        
                        disableInventory(500);
                        $.post("http://esx_inventoryhud/TakeFromProperty", JSON.stringify({
                            item: itemData,
                            number: parseInt(login)
                        }));
                    },
                allowOutsideClick: () => !Swal.isLoading()
                })
            } else if (type === "vault" && itemInventory === "second") {
                Swal.fire({
                    title: 'กรอกจำนวน',
                    input: 'number',
                    inputAttributes: {
                        autocapitalize: 'off'
                    },
                    showCancelButton: true,
                    confirmButtonText: 'OK',
                    customClass: 'swal-wide',
                    showLoaderOnConfirm: true,
                    preConfirm: (login) => {
                        
                        disableInventory(500);
                        $.post("http://esx_inventoryhud/TakeFromVault", JSON.stringify({
                            item: itemData,
                            number: parseInt(login)
                        }));
                    },
                allowOutsideClick: () => !Swal.isLoading()
                })
            } else if (type === "player" && itemInventory === "second") {
                Swal.fire({
                    title: 'กรอกจำนวน',
                    input: 'number',
                    inputAttributes: {
                        autocapitalize: 'off'
                    },
                    showCancelButton: true,
                    confirmButtonText: 'OK',
                    customClass: 'swal-wide',
                    showLoaderOnConfirm: true,
                    preConfirm: (login) => {
                        
                        disableInventory(500);
                        $.post("http://esx_inventoryhud/TakeFromPlayer", JSON.stringify({
                            item: itemData,
                            number: parseInt(login)
                        }));
                    },
                allowOutsideClick: () => !Swal.isLoading()
                })
            }
        }
    });

    $('#otherInventory').droppable({
        drop: function (event, ui) {
            itemData = ui.draggable.data("item");
            itemInventory = ui.draggable.data("inventory");

            if (type === "trunk" && itemInventory === "main") {
                Swal.fire({
                    title: 'กรอกจำนวน',
                    input: 'number',
                    inputAttributes: {
                        autocapitalize: 'off'
                    },
                    showCancelButton: true,
                    confirmButtonText: 'OK',
                    customClass: 'swal-wide',
                    showLoaderOnConfirm: true,
                    preConfirm: (login) => {
                        
                        disableInventory(500);
                        $.post("http://esx_inventoryhud/PutIntoTrunk", JSON.stringify({
                            item: itemData,
                            number: parseInt(login)
                        }));
                    },
                allowOutsideClick: () => !Swal.isLoading()
                })
            } else if (type === "property" && itemInventory === "main") {
                Swal.fire({
                    title: 'กรอกจำนวน',
                    input: 'number',
                    inputAttributes: {
                        autocapitalize: 'off'
                    },
                    showCancelButton: true,
                    confirmButtonText: 'OK',
                    customClass: 'swal-wide',
                    showLoaderOnConfirm: true,
                    preConfirm: (login) => {
                        
                        disableInventory(500);
                        $.post("http://esx_inventoryhud/PutIntoProperty", JSON.stringify({
                            item: itemData,
                            number: parseInt(login)
                        }));
                    },
                allowOutsideClick: () => !Swal.isLoading()
                })
            } else if (type === "vault" && itemInventory === "main") {
                Swal.fire({
                    title: 'กรอกจำนวน',
                    input: 'number',
                    inputAttributes: {
                        autocapitalize: 'off'
                    },
                    showCancelButton: true,
                    confirmButtonText: 'OK',
                    customClass: 'swal-wide',
                    showLoaderOnConfirm: true,
                    preConfirm: (login) => {
                        
                        disableInventory(500);
                        $.post("http://esx_inventoryhud/PutIntoVault", JSON.stringify({
                            item: itemData,
                            number: parseInt(login)
                        }));
                    },
                allowOutsideClick: () => !Swal.isLoading()
                })
            } else if (type === "player" && itemInventory === "main") {
                Swal.fire({
                    title: 'กรอกจำนวน',
                    input: 'number',
                    inputAttributes: {
                        autocapitalize: 'off'
                    },
                    showCancelButton: true,
                    confirmButtonText: 'OK',
                    customClass: 'swal-wide',
                    showLoaderOnConfirm: true,
                    preConfirm: (login) => {
                        
                        disableInventory(500);
                        $.post("http://esx_inventoryhud/PutIntoPlayer", JSON.stringify({
                            item: itemData,
                            number: parseInt(login)
                        }));
                    },
                allowOutsideClick: () => !Swal.isLoading()
                })
            }
        }
    });

    $("#count").on("keypress keyup blur", function (event) {
        $(this).val($(this).val().replace(/[^\d].+/, ""));
        if ((event.which < 48 || event.which > 57)) {
            event.preventDefault();
        }
    });
});

$.widget('ui.dialog', $.ui.dialog, {
    options: {
        // Determine if clicking outside the dialog shall close it
        clickOutside: false,
        // Element (id or class) that triggers the dialog opening 
        clickOutsideTrigger: ''
    },
    open: function () {
        var clickOutsideTriggerEl = $(this.options.clickOutsideTrigger),
            that = this;
        if (this.options.clickOutside) {
            // Add document wide click handler for the current dialog namespace
            $(document).on('click.ui.dialogClickOutside' + that.eventNamespace, function (event) {
                var $target = $(event.target);
                if ($target.closest($(clickOutsideTriggerEl)).length === 0 &&
                    $target.closest($(that.uiDialog)).length === 0) {
                    that.close();
                }
            });
        }
        // Invoke parent open method
        this._super();
    },
    close: function () {
        // Remove document wide click handler for the current dialog
        $(document).off('click.ui.dialogClickOutside' + this.eventNamespace);
        // Invoke parent close method 
        this._super();
    },
});