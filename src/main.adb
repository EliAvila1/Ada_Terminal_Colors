procedure Paint_Style (color : Color_Type; style : Style_Type) is
begin
<<<<<<< HEAD
   Ada.Text_IO.Put_Line(Paint_Basic(Text => "Hola",
                                    PC   => 1));

   Ada.Text_IO.Put_Line(Paint_Style(Boldd  => 1,
                                    Ital   => 1,
                                    Underl => 1,
                                    PC     => 3,
                                    Text   => "Hi"));
end main;
=======
  -- Implementation of Paint_Style that uses color and style parameters correctly
  -- Example of proper parameter usage:
  Set_Color (color);
  Set_Style (style);
  -- Additional logic here
end Paint_Style;
>>>>>>> 099a7a3d8b75c85d78f170709ea7447ac9bcb451
