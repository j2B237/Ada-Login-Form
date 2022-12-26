with Gtk.Widget;    use Gtk.Widget;
with Gtk.Button;    use Gtk.Button;

package window_pkg.callback is

   procedure Clear_Email_Field       ( Window : in Window_Access );
   procedure Clear_Password_Field    ( Window : in Window_Access );
   procedure Clear_Message           ( Window : in Window_Access );
   procedure On_Button_LogIn_Clicked ( Button : access Gtk_Button_Record'Class);
   procedure On_Button_Reset_Clicked ( Button : access Gtk_Button_Record'Class);
   function On_Window_Delete_Event   ( Object : access Gtk_Widget_Record'Class)
                                      return Boolean;
   

end window_pkg.callback;
