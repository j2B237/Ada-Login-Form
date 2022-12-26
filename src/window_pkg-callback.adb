with Gtk.Main;
with Ada.Text_IO;             use Ada.Text_IO;
with Ada.Strings.Unbounded;   use Ada.Strings.Unbounded;


package body window_pkg.callback is
   
   -----------------------
   -- Clear_Email_Field --
   -----------------------
   procedure Clear_Email_Field ( Window : in Window_Access ) is
   begin
      Window.EmailInput.Set_Text ("");
   end Clear_Email_Field;
   
   --------------------------
   -- Clear_Password_Field --
   --------------------------
   procedure Clear_Password_Field ( Window : in Window_Access ) is
   begin
      Window.PasswdInput.Set_Text("");
   end Clear_Password_Field;
   
   
   -------------------
   -- Clear_Message --
   -------------------
   procedure Clear_Message ( Window : in Window_Access ) is
   begin
      Window.Label1.Set_Text ("Your credentials");
   end Clear_Message;
   
   
   -----------------------------
   -- On_Button_LogIn_Clicked --
   -----------------------------
   procedure On_Button_LogIn_Clicked ( Button : access Gtk_Button_Record'Class) is
      Pragma Unreferenced (Button);
      
      Window      : Window_Access := Get_Window;
      User_Email  : Unbounded_String;
      User_Psswd  : Unbounded_String;
      
      EMAIL_EMPTY : exception ;
      PSSWD_EMPTY : exception ;
      PSSWD_LENGHT: exception ;
      
   begin
      User_Email := To_Unbounded_String ( Get_Text ( Window.EmailInput ) );
      User_Psswd := To_Unbounded_String ( Get_Text ( Window.PasswdInput ) );
      
      if To_String( User_Email ) = "" then
         raise EMAIL_EMPTY;
         
      elsif To_String( User_Psswd ) = "" then
         raise PSSWD_EMPTY;
         
      elsif Length ( User_Psswd ) < 8 then
         raise PSSWD_LENGHT;
      else
          Window.Label1.Set_Text (" Your Email is " 
                                  & To_String ( User_Email ) &
                                    " and password : " & To_String ( User_Psswd ) );
      end if;   
     
   exception
      when Constraint_Error =>
         Put_Line (" Error ");
      when EMAIL_EMPTY =>
         Clear_Message (Window);
         Window.Label1.Set_Text(" Email is invalid ");
      when PSSWD_EMPTY =>
         Clear_Message (Window);
         Window.Label1.Set_Text(" Password is invalid ");
      when PSSWD_LENGHT =>
         Clear_Message (Window);
         Window.Label1.Set_Text(" Password should have at least 8 characters ");
         
   end On_Button_LogIn_Clicked;
   
   -----------------------------
   -- On_Button_Reset_Clicked --
   -----------------------------
   procedure On_Button_Reset_Clicked ( Button : access Gtk_Button_Record'Class) is
      pragma Unreferenced (Button);
      Window : Window_Access := Get_Window;
   begin
      
      -- Clear form inputs
      Clear_Email_Field    ( Window => Window );
      Clear_Password_Field ( Window );
      Clear_Message        ( Window );
   end On_Button_Reset_Clicked;
   

   ----------------------------
   -- On_Window_Delete_Event --
   ----------------------------
   function On_Window_Delete_Event (Object : access Gtk_Widget_Record'Class)
                                    return Boolean is
   begin
      Gtk.Main.Main_Quit;
      return False;
   end On_Window_Delete_Event;
   

end window_pkg.callback;
