with terminal_table_colors; use terminal_table_colors;
with Basic_Color_Text;      use Basic_Color_Text;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;

Procedure main is
begin
   Ada.Text_IO.Put_Line(Paint_Basic(Text => "Hola",
                                    PC   => 1));

   Ada.Text_IO.Put_Line(Paint_Style(Boldd  => 1,
                                    Ital   => 1,
                                    Underl => 1,
                                    PC     => 3,
                                    Text   => "Hi"));
end main;
