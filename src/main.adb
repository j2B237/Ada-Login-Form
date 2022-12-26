------------------------------------------------------------
-- Author : Yossep237                                     --
-- Date   : 2022/12/26
-- Link   : www.github.com/j2B237                         --
-- A program to create a simple login form with GtkAda.   --
-- User can enter his email address, password and submit. --
-- User can also click on reset button to clear fields .  --
--                                                        --
-- Program handle differents exceptions :                 --
-- 1- User submit empty form                              --
-- 2- Password length is less than 8 characters           --
--                                                        --
-- ****************************************************** --
-- Notes :                                                --
-- The UI was design with Glade. Bc of issue with Gate3   --
-- i wasn't able to build to glade xml file. Therefore i  --
-- had to construct the entire UI by coding with Ada.     --
-- One of the issue i found is with Password field        --
-- I need to convert special character into UTF8 encoding --
-- character in order to hide user password when he is    --
-- typing. I couldn't find a way. I need to more time     --
------------------------------------------------------------

with Ada.Text_IO;             use Ada.Text_IO;
with Gtk.Main;
with Window_Pkg;              use Window_Pkg;

procedure Main is

   -- Renames Gtk main loop
   procedure Event_Loop renames Gtk.Main.Main;

   Window : Window_Access;

begin
   -- Initialize Gtk
   Gtk.Main.Init;
   Window_Pkg.Gtk_New(Window);
   Window.Show_All;
   Window.Present;

   -- Keep window active
   Event_Loop;

end Main;
