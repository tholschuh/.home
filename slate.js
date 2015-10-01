var fullscreen = slate.operation("move", {
    "width" : "1440",
    "height" : "900",
    "x" : "screenOriginX+-4",
    "y" : "screenOriginY+-22"
});

var fullscreenApps = function(win) {
    var appName = win.app().name();
    if ((appName === "Firefox" ||
         appName === "iTerm2")
         && win.screen().id() <= 4
         ) {
        win.doOperation(fullscreen);
    }
};

slate.bind("1:ctrl", function(win) {
    fullscreenApps(win);
});

slate.on("windowOpened", function(event, win) {
    fullscreenApps(win);
});
