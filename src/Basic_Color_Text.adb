package body Basic_Color_Text
with SPARK_Mode => On is
   pragma Assertion_Policy(Check);

   pragma Assert(Lio'Length = 16);

   function Paint_Basic (Text : in Text_Use; PC : in ID_Color) return Text_Use is
   begin
      return Text_Use'(Lio(PC) & Text & Reset);
   end Paint_Basic;


   function Paint_Style (Boldd, Ital, Underl : in ID_Style := 0; PC : in ID_Color := 8; Text : in Text_Use := White) return Text_Use is
      subtype Cmb is Integer range 0 .. 7;
      combo : Constant Cmb := (Integer(Boldd * 4) + Integer(Ital) * 2 + Integer(Underl));
   begin

      case combo is
         when 0 => --  (0,0,0)
            pragma Assert (Text'Length <= 512);
            return Text;
         when 1 => --  (0,0,1)
            pragma Assert (Text'Length <= 512);
            return Text_Use'(Underline & Lio(PC) & Text & Reset);
         when 2 => --  (0,1,0)
            pragma Assert (Text'Length <= 512);
            return Text_Use'(Italic & Lio(PC) & Text & Reset);
         when 3 => --  (0,1,1)
            pragma Assert (Text'Length <= 512);
            return Text_Use'(Italic & Underline & Lio(PC) & Text & Reset);
         when 4 => --  (1,0,0)
            pragma Assert (Text'Length <= 512);
            return Text_Use'(Bold & Lio(PC) & Text & Reset);
         when 5 => --  (1,0,1)
            pragma Assert (Text'Length <= 512);
            return Text_Use'(Bold & Underline & Lio(PC) & Text & Reset);
         when 6 => --  (1,1,0)
            pragma Assert (Text'Length <= 512);
            return Text_Use'(Bold & Italic & Lio(PC) & Text & Reset);
         when 7 => --  (1,1,1)
            pragma Assert (Text'Length <= 512);
            return Text_Use'(Bold & Italic & Underline & Lio(PC) & Text & Reset);
      end case;
   end Paint_Style;

end Basic_Color_Text;
