var fullscreen = slate.operation("move", {
    "width" : "screenSizeX+4",
    "height" : "screenSizeY+22",
    "x" : "screenOriginX+-4",
    "y" : "screenOriginY+-22"
});

var iTerm3fullscreen = slate.operation("move", {
    "width" : "screenSizeX+4",
    "height" : "screenSizeY+4",
    "x" : "screenOriginX-4",
    "y" : "screenOriginY"
});

var fullscreenApp = function(win) {
    var appName = win.app().name();
    if (win.screen().id() <= 4) {
        if (appName === "iTerm2") {
            win.doOperation(iTerm3fullscreen);
        } else {
            win.doOperation(fullscreen);
        }
    }
};

var movelefthalf = slate.operation("move", {
    "width" : "(screenSizeX+4)/2",
    "height" : "screenSizeY+4",
    "x" : "screenOriginX-4",
    "y" : "screenOriginY"
});

var moverighthalf = slate.operation("move", {
    "width" : "(screenSizeX+4)/2",
    "height" : "screenSizeY+4",
    "x" : "(screenOriginX-4)+((screenSizeX+4)/2)",
    "y" : "screenOriginY"
});

var lefthalf = function(win) {
    win.doOperation(movelefthalf)
};

var righthalf = function(win) {
    win.doOperation(moverighthalf)
};

slate.bind("1:ctrl", function(win) {
    fullscreenApp(win);
});

slate.bind("2:ctrl", function(win) {
    lefthalf(win);
});

slate.bind("3:ctrl", function(win) {
    righthalf(win);
});
