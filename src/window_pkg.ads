with Gtk.Window;                use Gtk.Window;
with Gtk.Application_Window;    use Gtk.Application_Window;
with Gtk.Fixed;                 use Gtk.Fixed;
with Gtk.Label;                 use Gtk.Label;
with Gtk.GEntry;                use Gtk.GEntry;
with Gtk.Button;                use Gtk.Button;


package Window_Pkg is

   -- Represent composite widget  
   type Window_Record is new Gtk_Window_Record with record
      
      Window                    : Gtk_Application_Window;
      Fixed                     : Gtk_Fixed;
      Label1, Label2, Label3    : Gtk_Label;
      EmailInput, PasswdInput   : Gtk_GEntry;
      LogBtn                    : Gtk_Button;
      ResetBtn                  : Gtk_Button;
      
   end record
     with Dynamic_Predicate =>
       Window /= null and Fixed /= null;
   
   type Window_Access is access all Window_Record'Class;
   -- Pointer on Window_Record widget
   
   procedure Gtk_New ( Window : out Window_Access );
   procedure Initialize ( Window : access Window_Record'Class );
   function Get_Window return Window_Access;
   
   
end Window_Pkg;
