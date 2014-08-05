var fullscreen = slate.operation("move", {
    "x" : "screenOriginX+-4",
    "y" : "screenOriginY+-22",
    "width" : "1440",
    "height" : "900"
});

slate.bind("1:ctrl", function(win) {
    // here win is a reference to the currently focused window
    var appName = win.app().name();
    if (appName === "Firefox") {
        win.doOperation(fullscreen);
    }
});
