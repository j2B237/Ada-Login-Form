with Glib;
with Gtk.Widget;              
with Gdk;                     use Gdk;
with Gtk.Enums;               use Gtk.Enums;
with Gtkada.Handlers;         use Gtkada.Handlers;
with Callback_Pkg;            use Callback_Pkg;
with Window_Pkg.callback;     use Window_Pkg.callback;



package body Window_Pkg is
   
   Window_Ptr : Window_Access := null;
   
   -------------
   -- Gtk_New --
   -------------
   procedure Gtk_New ( Window : out Window_Access ) is
   begin
      -- Gtk_New allocate memory for this widget.
      -- Instantiate an object type Window Record whereas the initialize call
      -- creates the C widget and associates it with the Ada type
      Window     := new Window_Record;
      Window_Pkg.Initialize(Window => Window);
      Window_Ptr := Window;
   end Gtk_New;
   -- End
   
   ----------------
   -- Initialize --
   ----------------
   procedure Initialize ( Window : access Window_Record'Class ) is
      pragma Suppress (All_Checks);
  
   begin
      -- creates the C widgets and associates it with the Ada type
      Gtk.Window.Initialize(Window);
      Window.Set_Title(Title => "User Data");
      Window.Set_Margin_Top(Margin => Glib.Gint(5));
      Window.Set_Margin_Bottom (Margin => Glib.Gint(5) );
      Window.Set_Hexpand (Expand => False);
      Window.Set_Vexpand (Expand => False);
      Window.Set_Position (Position => Win_Pos_Center);
      
      -- Create Fixed container
      Gtk_New (Window.Fixed);
      Window.Add(Widget => Window.Fixed);
      
      -- Create Label1
      Gtk_New ( Window.Label1 );
      Window.Label1.Set_Label        ("Your credentials");
      Window.Label1.Set_Size_Request (Width  => Glib.Gint(195),
                                      Height => Glib.Gint(80));
      Window.Label1.Set_Halign       (Align => Gtk.Widget.Align_Center);
      Window.Label1.Set_Valign       (Align => Gtk.Widget.Align_Center);
      Window.Label1.Set_Margin_Left  (Margin => Glib.Gint(41));
      Window.Label1.Set_Margin_Right (Margin => Glib.Gint(83));
      Window.Label1.Set_Justify (Jtype => Justify_Center);
      
      Window.Fixed.Add(Window.Label1);
      Window.Fixed.Move (Widget => Window.Label1,
                         X      => Glib.Gint(188),
                         Y      => Glib.Gint(16));
      
      
      -- Create Label2
      Gtk_New (Window.Label2);
      Window.Label2.Set_Label        ("Email");
      Window.Label2.Set_Size_Request (Width  => Glib.Gint(100),
                                      Height => Glib.Gint(47));
      Window.Fixed.Add(Window.Label2);
      Window.Fixed.Move (Widget => Window.Label2,
                         X      => Glib.Gint(58),
                         Y      => Glib.Gint(127));
      
      -- Create Label3
      Gtk_New (Window.Label3);
      Window.Label3.Set_Label        ("Mot de passe");
      Window.Label3.Set_Size_Request (Width  => Glib.Gint(101),
                                      Height => Glib.Gint(46));
      Window.Fixed.Add(Window.Label3);
      Window.Fixed.Move(Widget => Window.Label3,
                        X      => Glib.Gint(68),
                        Y      => Glib.Gint(221));
     
      
       -- Create Email form Input 
      Gtk_New (Window.EmailInput);
      Window.EmailInput.Set_Size_Request (Width  => Glib.Gint(230),
                                          Height => Glib.Gint(50));
      Window.EmailInput.Set_Halign (Align => Gtk.Widget.Align_Start);
      Window.EmailInput.Set_Valign (Align => Gtk.Widget.Align_Center);
      Window.EmailInput.Set_Margin_Left (Margin => Glib.Gint(2));
      Window.EmailInput.Set_Margin_Right (Margin => Glib.Gint(2));
      Window.EmailInput.Set_Margin_Top (Margin => Glib.Gint(2));
      Window.EmailInput.Set_Margin_Bottom (Margin => Glib.Gint(2));
      Window.EmailInput.Set_Placeholder_Text (Text => "example@gmail.com");
      Window.EmailInput.Set_Input_Purpose (Purpose => Input_Purpose_Email);

      Window.Fixed.Add(Window.EmailInput);
      Window.Fixed.Move(Widget => Window.EmailInput,
                        X      => Glib.Gint(210),
                        Y      => Glib.Gint(121));
      
       -- Create Password form Input 
      Gtk_New (Window.PasswdInput);
      Window.PasswdInput.Set_Size_Request (Width  => Glib.Gint(230),
                                          Height => Glib.Gint(50));
      Window.PasswdInput.Set_Halign (Align => Gtk.Widget.Align_Start);
      Window.PasswdInput.Set_Valign (Align => Gtk.Widget.Align_Center);
      Window.PasswdInput.Set_Margin_Left (Margin => Glib.Gint(2));
      Window.PasswdInput.Set_Margin_Right (Margin => Glib.Gint(2));
      Window.PasswdInput.Set_Margin_Top (Margin => Glib.Gint(2));
      Window.PasswdInput.Set_Margin_Bottom (Margin => Glib.Gint(2));
      Window.PasswdInput.Set_Max_Length (Max => Glib.Gint(20));
      Window.PasswdInput.Set_Visible (Visible => False);
      
      --Window.PasswdInput.Set_Invisible_Char (Char => Glib.Gunichar());
      Window.PasswdInput.Set_Placeholder_Text (Text => "Type your password");
      Window.PasswdInput.Set_Input_Purpose (Purpose => Input_Purpose_Password);

      Window.Fixed.Add(Window.PasswdInput);
      Window.Fixed.Move(Widget => Window.PasswdInput,
                        X      => Glib.Gint(212),
                        Y      => Glib.Gint(217));
      
      -- Create login button
      Gtk_New (Window.LogBtn);
      Window.LogBtn.Set_Label ("Log in");
      Window.LogBtn.Set_Size_Request (Width  => Glib.Gint(120),
                                      Height => Glib.Gint(50));
      Window.LogBtn.Set_Halign (Align => Gtk.Widget.Align_Center);
      Window.LogBtn.Set_Valign (Align => Gtk.Widget.Align_Center);
      Window.LogBtn.Set_Margin_Left (Margin => Glib.Gint(2));
      Window.LogBtn.Set_Margin_Right (Margin => Glib.Gint(2));
      Window.LogBtn.Set_Margin_Top (Margin => Glib.Gint(2));
      Window.LogBtn.Set_Margin_Bottom (Margin => Glib.Gint(2));
      
      Window.Fixed.Add(Window.LogBtn);
      Window.Fixed.Move(Widget => Window.LogBtn,
                        X      => Glib.Gint(197),
                        Y      => Glib.Gint(345));
      
      
      -- Create Reset button
      Gtk_New (Window.ResetBtn);
      Window.ResetBtn.Set_Label ("Reset");
      Window.ResetBtn.Set_Size_Request (Width  => Glib.Gint(120),
                                      Height => Glib.Gint(50));
      Window.ResetBtn.Set_Halign (Align => Gtk.Widget.Align_Center);
      Window.ResetBtn.Set_Valign (Align => Gtk.Widget.Align_Center);
      Window.ResetBtn.Set_Margin_Left (Margin => Glib.Gint(2));
      Window.ResetBtn.Set_Margin_Right (Margin => Glib.Gint(2));
      Window.ResetBtn.Set_Margin_Top (Margin => Glib.Gint(2));
      Window.ResetBtn.Set_Margin_Bottom (Margin => Glib.Gint(2));
      
      Window.Fixed.Add(Window.ResetBtn);
      Window.Fixed.Move(Widget => Window.ResetBtn,
                        X      => Glib.Gint(334),
                        Y      => Glib.Gint(345));
      
      
      
      -- Connect signals
      
      -- When Log in button is clicked
      UI_Handler.Connect (Window.LogBtn, "clicked", 
                          UI_Handler.To_Marshaller (On_Button_LogIn_Clicked'Access),
                          False);
      
      -- When Reset button is clicked
      UI_Handler.Connect (Window.ResetBtn, "clicked",
                          UI_Handler.To_Marshaller (On_Button_Reset_Clicked'Access),
                          False);
      
      -- When Quit window
      Return_Callback.Connect 
        (Window, "delete_event", On_Window_Delete_Event'Access, False);
      
   end Initialize;
   -- End
   
   ----------------
   -- Get_Window --
   ----------------
   function Get_Window return Window_Access is
   begin
      return Window_Ptr;
   end Get_Window;
   -- End
   

end Window_Pkg;
