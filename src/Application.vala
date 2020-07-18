public class MyApp : Gtk.Application {
    public MyApp(){
        Object (
            application_id: "com.github.abanoub-hanna.gtk-pos",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }
    protected override void activate(){
        var sample_btn = new Gtk.Button.with_label("Click Me!"){
            margin = 12
        };
        sample_btn.clicked.connect(()=>{
            sample_btn.label = "Hello World";
            sample_btn.sensitive = false;
        });
        var main_window = new Gtk.ApplicationWindow(this){
            default_height = 300,
            default_width = 300,
            title = "Smart POS"
        };
        main_window.add(sample_btn);
        main_window.show_all();
    }
    public static int main(string[] args){
        return new MyApp().run(args);
    }
}
