#!/usr/bin/gjs

const Notify = imports.gi.Notify;


for (i = 1; i < 100; i++) {
    print('hi');
}
Notify.init("Hello world");
var Hello = new Notify.Notification({
    summary: "Hello world!",
    body: "This is an example notification.",
    "icon-name": "dialog-information"
});
Hello.show();
