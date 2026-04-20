with terminal_table_colors; use terminal_table_colors;
with Basic_Color_Text;      use Basic_Color_Text;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;

Procedure main is
begin
   Ada.Text_IO.Put_Line(Paint_Basic(Text => "A",
                                    PC   => 1));

   Ada.Text_IO.Put_Line(Paint_Style(Boldd  => ,
                                    Ital   => ,
                                    Underl => ,
                                    PC     => ,
                                    Text   => )
   Ada.Text_IO.Put_Line("jUM");
end main;
