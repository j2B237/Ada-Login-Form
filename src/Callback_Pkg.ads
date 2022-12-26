with Gtk.Handlers;
pragma Elaborate_All (Gtk.Handlers);
with Gtk.Button;       use Gtk.Button;

package Callback_Pkg is

   package UI_Handler is new
     Gtk.Handlers.Callback (Widget_Type => Gtk_Button_Record);

end Callback_Pkg;
