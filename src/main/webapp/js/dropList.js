var isShown;
var table = document.getElementById("users");
var rowsCount = document.getElementById("users").rows.length;
var button = document.getElementById("showMore");

showLess();

function showLess() {
    if (rowsCount > 6) {
        for (var i = 6; i < rowsCount; i++) {
            table.rows[i].style.display = "none";
        }
        isShown = false;
        button.setAttribute( "onClick", "showMore()" );
        button.innerText = "🢃";
    } else {
        button.style.display = "none";
    }

}

function showMore() {
    for (var i = 6; i < rowsCount; i++) {
        if (table.rows[i].style.display === "none") {
            table.rows[i].style.display = "table-row";
        }
    }
    button.setAttribute( "onClick", "showLess()" );
    button.innerText = "🢁";
    isShown = true;
}