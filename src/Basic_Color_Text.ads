with terminal_table_colors; use terminal_table_colors;
with Ada.Characters.Latin_1;
package Basic_Color_Text
with SPARK_Mode => On
is
   subtype Text_Use is String;
   subtype ID_Color is Positive range 1 .. 16;

   type Paint_List is array(ID_Color) of Text_Use(1 .. 5);
   Lio : Constant Paint_List := (1  => Black,         2  => Red,
                                 3  => Green,         4  => Yellow,
                                 5  => Blue,          6  => Purple,
                                 7  => Cyan,          8  => White,
                                 9  => Bright_Black, 10 => Bright_Red,
                                 11 => Bright_Green, 12 => Bright_Yellow,
                                 13 => Bright_Blue,  14 => Bright_Purple,
                                 15 => Bright_Cyan,  16 => Bright_White);

   function Paint_Basic (Text : in Text_Use; PC : in ID_Color) return Text_Use
     with Pre => Text'Length in 1 .. 512 and then PC'Valid
     and then (for all Char in Text'Range => Text(char) /= ASCII.ESC)
     and then (for all Char in Text'Range => Text(char) /= Ada.Characters.Latin_1.ESC),
     Post => Paint_Basic'Result'Length - Text'Length = 9;


   subtype ID_Style is Integer range 0 .. 1
     with Static_Predicate => ID_Style in 0 | 1;
   type ID_Style_Pos is array (1 .. 3) of ID_Style;

   function Paint_Style (Boldd, Ital, Underl : in ID_Style := 0; PC : in ID_Color := 8; Text : in Text_Use := White) return Text_Use
     with Pre => (Boldd'Valid) and then (Ital'Valid) and then (Underl'Valid)
     and then (PC'Valid) and then (Text'Length in 1 .. 512)
     and then (for all Char in Text'Range => Text(char) /= ASCII.ESC)
     and then (for all Char in Text'Range => Text(char) /= Ada.Characters.Latin_1.ESC);

end Basic_Color_Text;
