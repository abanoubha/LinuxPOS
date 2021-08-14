/*
* Copyright (c) 2020 Your Organization (https://abanoubhanna.com)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Author <abanoubhannaa73@gmail.com>
*/

const string appId = "com.github.abanoub-hanna.LinuxPOS";

public class MyApp : Gtk.Application {
    public MyApp(){
        Object (
            application_id: appId,
            flags: ApplicationFlags.FLAGS_NONE
        );
    }
    protected override void activate(){
        var grid = new Gtk.Grid();
        grid.orientation = Gtk.Orientation.VERTICAL;
        grid.add (new Gtk.Label (_("Label 1")));
        grid.add (new Gtk.Label (_("Label 2")));
        var notify_btn = new Gtk.Button.with_label(_("Click Me!"));
        notify_btn.clicked.connect(()=>{
            //TODO:show notification
            var notification = new Notification (_("Hello Guys!"));
            var icon = new GLib.ThemedIcon ("dialog-warning");
            notification.set_icon (icon);
            notification.set_body (_("the content of notif."));
            send_notification (appId, notification);
            // notify_btn.sensitive = false;
        });
        var main_window = new Gtk.ApplicationWindow(this){
            default_height = 300,
            default_width = 300,
            title = "Linux POS"
        };
        grid.add(notify_btn);

        var dark_mode_switch = new Gtk.Switch();
        grid.add(dark_mode_switch);

        main_window.add(grid);
        main_window.show_all();

        var settings = new GLib.Settings (appId);
        settings.bind ("dark-mode", dark_mode_switch, "active", GLib.SettingsBindFlags.DEFAULT);
    }
    public static int main(string[] args){
        return new MyApp().run(args);
    }
}
