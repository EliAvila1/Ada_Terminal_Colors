with Ada.Characters.Latin_1; --  DO NOT REMOVE (-_-)
with Ada.Strings.Unbounded;  --  DO NOT REMOVE (-_-)
--------------------------------------------------------------------------------

package terminal_table_colors is

   subtype Colors is String;

   Reset                 : Constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[0m";
   Clean_Screen          : Constant String(1 .. 7) := Ada.Characters.Latin_1.ESC & "[3J" & Ada.Characters.Latin_1.ESC & "[H";

   --=========================================================================--
   --======= ANSI ESCAPE SEQUENCES - TERMINAL CONTROL & TEXT ATTRIBUTES ======--
   --=========================================================================--

   --  Cursor Movement
   Home                  : constant Colors(1 .. 3) := Ada.Characters.Latin_1.ESC & "[H";
   Move_Up               : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[1A";
   Move_Down             : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[1B";
   Move_Right            : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[1C";
   Move_Left             : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[1D";
   Next_Line             : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[1E";
   Prev_Line             : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[1F";
   Set_Column            : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[1G";
   Save_Pos              : constant Colors(1 .. 3) := Ada.Characters.Latin_1.ESC & "[s";
   Restore_Pos           : constant Colors(1 .. 3) := Ada.Characters.Latin_1.ESC & "[u";

   --  Erasing
   Clear_Screen          : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[2J";
   Clear_Scroll          : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[3J";
   Clear_From_Cur        : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[0J";
   Clear_To_Cur          : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[1J";
   Clear_Line            : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[2K";
   Clear_Line_Right      : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[0K";
   Clear_Line_Left       : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[1K";

   --  Text Editing
   Insert_Line           : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[1L";
   Delete_Line           : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[1M";
   Delete_Char           : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[1P";
   Erase_Char            : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[1X";
   Insert_Space          : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[1@";

   --  Scrolling
   Scroll_Up             : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[1S";
   Scroll_Down           : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[1T";

   --  Cursor Shapes (Style)
   Cursor_Blink_Block    : constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[1 q";
   Cursor_Steady_Block   : constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[2 q";
   Cursor_Blink_Under    : constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[3 q";
   Cursor_Steady_Under   : constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[4 q";
   Cursor_Blink_Bar      : constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[5 q";
   Cursor_Steady_Bar     : constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[6 q";

   --  Visibility and Screen Modes
   Hide_Cursor           : constant Colors(1 .. 6) := Ada.Characters.Latin_1.ESC & "[?25l";
   Show_Cursor           : constant Colors(1 .. 6) := Ada.Characters.Latin_1.ESC & "[?25h";
   Alt_Buffer_On         : constant Colors(1 .. 8) := Ada.Characters.Latin_1.ESC & "[?1049h";
   Alt_Buffer_Off        : constant Colors(1 .. 8) := Ada.Characters.Latin_1.ESC & "[?1049l";
   Wrap_On               : constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[?7h";
   Wrap_Off              : constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[?7l";

   --  Tabs
   Set_Tab               : constant Colors(1 .. 2) := Ada.Characters.Latin_1.ESC & "H";
   Clear_Tab             : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[0g";
   Clear_All_Tabs        : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[3g";

   --  Text Attributes
   Bold                  : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[1m";
   Soft_Text             : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[2m";
   Italic                : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[3m";
   Underline             : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[4m";
   Blink                 : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[5m";
   Inverse               : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[7m";
   Hide                  : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[8m";
   Strikethrough         : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[9m";

   --  Reset and Info
   Get_Cursor_Pos        : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[6n";
   Device_Status         : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[5n";
   Identify              : constant Colors(1 .. 4) := Ada.Characters.Latin_1.ESC & "[0c";
   Hard_Reset            : constant Colors(1 .. 2) := Ada.Characters.Latin_1.ESC & "c";

   --=========================================================================--
   --========== BASIC COLORS , BRIGHTS COLORS, STYLES, BACKGROUNDS ===========--
   --=========================================================================--

   -----------------------------------------------------------------------------
   --                            EXAMPLES                                     --
   --                                                                         --
   --  Message : Constant String := Red & Underline & "Text" & Reset;         --
   --                                                                         --
   --  " " " "  := Red & Underline & "Text" & Reset & Blue & "Text" & Reset   --
   --                                                                         --
   --  [Ada.Text_IO.Put/@(Message);]                                          --
   --                                                                         --
   --  Large way    [Ada.Text_IO.Put/@(Bold & Blue & "Text " & Reset)         --
   --                                                                         --
   --  Short way    [Ada.Text_IO.Put/@(Bold_Blue & "Text " & Reset)           --
   --                                                                         --
   --  Use function [[Ada.Text_IO.Put/@(TBold(Blue, "Text")                   --
   --                                                                         --
   --  Each function will have mixed-style and single-style fucntion          --
   -----------------------------------------------------------------------------

   -- Basic Colors
   Black                 : Constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[30m";  -- Black  / Negro                           (PC - 1);
   Red                   : Constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[31m";  -- Red    / Rojo                            (PC - 2);
   Green                 : Constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[32m";  -- Green  / Verde                           (PC - 3);
   Yellow                : Constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[33m";  -- Yellow / Amarillo                        (PC - 4);
   Blue                  : Constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[34m";  -- Blue   / Azul                            (PC - 5);
   Purple                : Constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[35m";  -- Purple / Purpura                         (PC - 6);
   Cyan                  : Constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[36m";  -- Cyan   / Cyan                            (PC - 7);
   White                 : Constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[37m";  -- White  / Blanco                          (PC - 8);

   -- Bright Basic Color
   Bright_Black          : Constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[90m";  -- Brigth Black  / Negro    Brillante      (PC -  9);
   Bright_Red            : Constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[91m";  -- Brigth Red    / Rojo     Brillante      (PC - 10);
   Bright_Green          : Constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[92m";  -- Brigth Green  / Verde    Brillante      (PC - 11);
   Bright_Yellow         : Constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[93m";  -- Brigth Yellow / Amarillo Brillante      (PC - 12);
   Bright_Blue           : Constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[94m";  -- Brigth Blue   / Azul     Brillante      (PC - 13);
   Bright_Purple         : Constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[95m";  -- Brigth Purlpe / Purpura  Brillante      (PC - 14);
   Bright_Cyan           : Constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[96m";  -- Brigth Cyan   / Cyan     Brillante      (PC - 15);
   Bright_White          : Constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[97m";  -- Brigth White  / Blanco   Brillante      (PC - 16);

   -- Bold and Color text included
   Bold_Black            : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[1;30m";
   Bold_Red              : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[1;31m";
   Bold_Green            : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[1;32m";
   Bold_Yellow           : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[1;33m";
   Bold_Blue             : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[1;34m";
   Bold_Purple           : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[1;35m";
   Bold_Cyan             : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[1;36m";
   Bold_White            : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[1;37m";

   -- Brigth Bold and Text color included
   Bold_Bright_Black     : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[1;90m";
   Bold_Bright_Red       : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[1;91m";
   Bold_Bright_Green     : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[1;92m";
   Bold_Bright_Yellow    : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[1;93m";
   Bold_Bright_Blue      : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[1;94m";
   Bold_Bright_Purple    : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[1;95m";
   Bold_Bright_Cyan      : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[1;96m";
   Bold_Bright_White     : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[1;97m";

   -------------------------------------
   -- Normal and Intensity BACKGROUND --
   -------------------------------------
   Background_Black      : Constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[40m";
   Background_Red        : Constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[41m";
   Background_Green      : Constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[42m";
   Background_Yellow     : Constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[43m";
   Background_Blue       : Constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[44m";
   Background_Purple     : Constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[45m";
   Background_Cyan       : Constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[46m";
   Background_White      : Constant Colors(1 .. 5) := Ada.Characters.Latin_1.ESC & "[47m";

   Back_Bright_Black     : Constant Colors(1 .. 6) := Ada.Characters.Latin_1.ESC & "[100m";
   Back_Bright_Red       : Constant Colors(1 .. 6) := Ada.Characters.Latin_1.ESC & "[101m";
   Back_Bright_Green     : Constant Colors(1 .. 6) := Ada.Characters.Latin_1.ESC & "[102m";
   Back_Bright_Yellow    : Constant Colors(1 .. 6) := Ada.Characters.Latin_1.ESC & "[103m";
   Back_Bright_Blue      : Constant Colors(1 .. 6) := Ada.Characters.Latin_1.ESC & "[104m";
   Back_Bright_Purple    : Constant Colors(1 .. 6) := Ada.Characters.Latin_1.ESC & "[105m";
   Back_Bright_Cyan      : Constant Colors(1 .. 6) := Ada.Characters.Latin_1.ESC & "[106m";
   Back_Bright_White     : Constant Colors(1 .. 6) := Ada.Characters.Latin_1.ESC & "[107m";

   -----------------------
   ------ Underline ------
   -----------------------
   Underline_Text_Black  : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[4;30m";
   Underline_Text_Red    : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[4;31m";
   Underline_Text_Green  : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[4;32m";
   Underline_Text_Yellow : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[4;33m";
   Underline_Text_Blue   : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[4;34m";
   Underline_Text_Purple : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[4;35m";
   Underline_Text_Cyan   : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[4;36m";
   Underline_Text_White  : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[4;37m";

   -----------------------
   ----- Italic Basic ----
   -----------------------
   Italic_Black          : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[3;30m";
   Italic_Red            : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[3;31m";
   Italic_Green          : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[3;32m";
   Italic_Yellow         : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[3;33m";
   Italic_Blue           : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[3;34m";
   Italic_Purple         : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[3;35m";
   Italic_Cyan           : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[3;36m";
   Italic_White          : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[3;37m";

   -------------------------
   -- Bright Italic Basic --
   -------------------------
   Italic_Bright_Black   : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[3;90m";
   Italic_Bright_Red     : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[3;91m";
   Italic_Bright_Green   : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[3;92m";
   Italic_Bright_Yellow  : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[3;93m";
   Italic_Bright_Blue    : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[3;94m";
   Italic_Bright_Purple  : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[3;95m";
   Italic_Bright_Cyan    : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[3;96m";
   Italic_Bright_White   : Constant Colors(1 .. 7) := Ada.Characters.Latin_1.ESC & "[3;97m";


   --------------------------------
   -- Style Italic, Blink, Color --
   --------------------------------
   Italic_Blink_Black    : Constant Colors(1 .. 9) := Ada.Characters.Latin_1.ESC & "[3;5;30m";
   Italic_Blink_Red      : Constant Colors(1 .. 9) := Ada.Characters.Latin_1.ESC & "[3;5;31m";
   Italic_Blink_Green    : Constant Colors(1 .. 9) := Ada.Characters.Latin_1.ESC & "[3;5;32m";
   Italic_Blink_Yellow   : Constant Colors(1 .. 9) := Ada.Characters.Latin_1.ESC & "[3;5;33m";
   Italic_Blink_Blue     : Constant Colors(1 .. 9) := Ada.Characters.Latin_1.ESC & "[3;5;34m";
   Italic_Blink_Purple   : Constant Colors(1 .. 9) := Ada.Characters.Latin_1.ESC & "[3;5;35m";
   Italic_Blink_Cyan     : Constant Colors(1 .. 9) := Ada.Characters.Latin_1.ESC & "[3;5;36m";
   Italic_Blink_White    : Constant Colors(1 .. 9) := Ada.Characters.Latin_1.ESC & "[3;5;37m";




   -----------------------------------------------------------------------------
   ------  6 × 6 × 6 CUBE, ALL COLORS, MIXED, INTENSE, INTENSE, SOFT, ETC ------
   -----------------------------------------------------------------------------

   -----------------------------------------------
   -- B_0 - B_7  => standard colors [30M - 37m] --
   -----------------------------------------------
   B_0                   : Constant Colors(1 .. 9)  := Ada.Characters.Latin_1.ESC & "[38;5;0m";
   B_1                   : Constant Colors(1 .. 9)  := Ada.Characters.Latin_1.ESC & "[38;5;1m";
   B_2                   : Constant Colors(1 .. 9)  := Ada.Characters.Latin_1.ESC & "[38;5;2m";
   B_3                   : Constant Colors(1 .. 9)  := Ada.Characters.Latin_1.ESC & "[38;5;3m";
   B_4                   : Constant Colors(1 .. 9)  := Ada.Characters.Latin_1.ESC & "[38;5;4m";
   B_5                   : Constant Colors(1 .. 9)  := Ada.Characters.Latin_1.ESC & "[38;5;5m";
   B_6                   : Constant Colors(1 .. 9)  := Ada.Characters.Latin_1.ESC & "[38;5;6m";
   B_7                   : Constant Colors(1 .. 9)  := Ada.Characters.Latin_1.ESC & "[38;5;7m";

   ----------------------------------------------------
   -- B_8 - B_15 => high intensity Color [90m - 97m] --
   ----------------------------------------------------
   B_8                   : Constant Colors(1 .. 9)  := Ada.Characters.Latin_1.ESC & "[38;5;8m";
   B_9                   : Constant Colors(1 .. 9)  := Ada.Characters.Latin_1.ESC & "[38;5;9m";
   B_10                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;10m";
   B_11                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;11m";
   B_12                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;12m";
   B_13                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;13m";
   B_14                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;14m";
   B_15                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;15m";

   -------------------------------------------------
   -- B_16 - B_231 => 6 × 6 × 6 cube [216 colors] --
   -------------------------------------------------
   B_16                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;16m";
   B_17                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;17m";
   B_18                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;18m";
   B_19                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;19m";
   B_20                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;20m";
   B_21                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;21m";
   B_22                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;22m";
   B_23                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;23m";
   B_24                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;24m";
   B_25                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;25m";
   B_26                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;26m";
   B_27                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;27m";
   B_28                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;28m";
   B_29                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;29m";
   B_30                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;30m";
   B_31                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;31m";
   B_32                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;32m";
   B_33                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;33m";
   B_34                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;34m";
   B_35                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;35m";
   B_36                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;36m";
   B_37                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;37m";
   B_38                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;38m";
   B_39                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;39m";
   B_40                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;40m";
   B_41                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;41m";
   B_42                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;42m";
   B_43                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;43m";
   B_44                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;44m";
   B_45                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;45m";
   B_46                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;46m";
   B_47                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;47m";
   B_48                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;48m";
   B_49                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;49m";
   B_50                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;50m";
   B_51                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;51m";
   B_52                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;52m";
   B_53                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;53m";
   B_54                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;54m";
   B_55                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;55m";
   B_56                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;56m";
   B_57                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;57m";
   B_58                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;58m";
   B_59                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;59m";
   B_60                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;60m";
   B_61                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;61m";
   B_62                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;62m";
   B_63                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;63m";
   B_64                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;64m";
   B_65                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;65m";
   B_66                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;66m";
   B_67                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;67m";
   B_68                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;68m";
   B_69                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;69m";
   B_70                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;70m";
   B_71                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;71m";
   B_72                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;72m";
   B_73                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;73m";
   B_74                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;74m";
   B_75                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;75m";
   B_76                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;76m";
   B_77                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;77m";
   B_78                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;78m";
   B_79                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;79m";
   B_80                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;80m";
   B_81                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;81m";
   B_82                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;82m";
   B_83                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;83m";
   B_84                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;84m";
   B_85                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;85m";
   B_86                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;86m";
   B_87                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;87m";
   B_88                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;88m";
   B_89                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;89m";
   B_90                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;90m";
   B_91                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;91m";
   B_92                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;92m";
   B_93                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;93m";
   B_94                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;94m";
   B_95                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;95m";
   B_96                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;96m";
   B_97                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;97m";
   B_98                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;98m";
   B_99                  : Constant Colors(1 .. 10) := Ada.Characters.Latin_1.ESC & "[38;5;99m";
   B_100                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;100m";
   B_101                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;101m";
   B_102                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;102m";
   B_103                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;103m";
   B_104                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;104m";
   B_105                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;105m";
   B_106                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;106m";
   B_107                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;107m";
   B_108                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;108m";
   B_109                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;109m";
   B_110                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;110m";
   B_111                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;111m";
   B_112                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;112m";
   B_113                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;113m";
   B_114                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;114m";
   B_115                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;115m";
   B_116                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;116m";
   B_117                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;117m";
   B_118                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;118m";
   B_119                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;119m";
   B_120                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;120m";
   B_121                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;121m";
   B_122                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;122m";
   B_123                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;123m";
   B_124                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;124m";
   B_125                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;125m";
   B_126                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;126m";
   B_127                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;127m";
   B_128                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;128m";
   B_129                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;129m";
   B_130                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;130m";
   B_131                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;131m";
   B_132                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;132m";
   B_133                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;133m";
   B_134                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;134m";
   B_135                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;135m";
   B_136                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;136m";
   B_137                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;137m";
   B_138                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;138m";
   B_139                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;139m";
   B_140                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;140m";
   B_141                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;141m";
   B_142                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;142m";
   B_143                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;143m";
   B_144                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;144m";
   B_145                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;145m";
   B_146                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;146m";
   B_147                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;147m";
   B_148                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;148m";
   B_149                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;149m";
   B_150                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;150m";
   B_151                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;151m";
   B_152                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;152m";
   B_153                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;153m";
   B_154                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;154m";
   B_155                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;155m";
   B_156                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;156m";
   B_157                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;157m";
   B_158                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;158m";
   B_159                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;159m";
   B_160                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;160m";
   B_161                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;161m";
   B_162                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;162m";
   B_163                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;163m";
   B_164                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;164m";
   B_165                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;165m";
   B_166                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;166m";
   B_167                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;167m";
   B_168                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;168m";
   B_169                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;169m";
   B_170                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;170m";
   B_171                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;171m";
   B_172                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;172m";
   B_173                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;173m";
   B_174                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;174m";
   B_175                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;175m";
   B_176                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;176m";
   B_177                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;177m";
   B_178                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;178m";
   B_179                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;179m";
   B_180                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;180m";
   B_181                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;181m";
   B_182                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;182m";
   B_183                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;183m";
   B_184                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;184m";
   B_185                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;185m";
   B_186                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;186m";
   B_187                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;187m";
   B_188                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;188m";
   B_189                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;189m";
   B_190                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;190m";
   B_191                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;191m";
   B_192                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;192m";
   B_193                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;193m";
   B_194                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;194m";
   B_195                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;195m";
   B_196                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;196m";
   B_197                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;197m";
   B_198                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;198m";
   B_199                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;199m";
   B_200                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;200m";
   B_201                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;201m";
   B_202                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;202m";
   B_203                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;203m";
   B_204                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;204m";
   B_205                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;205m";
   B_206                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;206m";
   B_207                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;207m";
   B_208                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;208m";
   B_209                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;209m";
   B_210                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;210m";
   B_211                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;211m";
   B_212                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;212m";
   B_213                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;213m";
   B_214                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;214m";
   B_215                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;215m";
   B_216                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;216m";
   B_217                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;217m";
   B_218                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;218m";
   B_219                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;219m";
   B_220                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;220m";
   B_221                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;221m";
   B_222                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;222m";
   B_223                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;223m";
   B_224                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;224m";
   B_225                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;225m";
   B_226                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;226m";
   B_227                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;227m";
   B_228                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;228m";
   B_229                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;229m";
   B_230                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;230m";
   B_231                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;231m";

   ----------------------------------------------------
   -- B_232 - B_255 => Gray scale color Dark > Light --
   ----------------------------------------------------
   B_232                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;232m";
   B_233                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;233m";
   B_234                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;234m";
   B_235                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;235m";
   B_236                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;236m";
   B_237                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;237m";
   B_238                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;238m";
   B_239                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;239m";
   B_240                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;240m";
   B_241                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;241m";
   B_242                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;242m";
   B_243                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;243m";
   B_244                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;244m";
   B_245                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;245m";
   B_246                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;246m";
   B_247                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;247m";
   B_248                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;248m";
   B_249                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;249m";
   B_250                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;250m";
   B_251                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;251m";
   B_252                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;252m";
   B_253                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;253m";
   B_254                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;254m";
   B_255                 : Constant Colors(1 .. 11) := Ada.Characters.Latin_1.ESC & "[38;5;255m";


   -----------------------------------------------------------------------------
   --  If you wanna see all colors, Run this code                             --
   --                                                                         --
   --  with terminal_table_colors; use terminal_table_colors;                 --
   --  With Ada.Text_IO;                                                      --
   --  With Ada.Strings.Unbounded;                                            --
   --                                                                         --
   --  Procedure main is                                                      --
   --  begin                                                                  --
   --  For I in L'First .. L'Last loop                                        --
   --  Ada.Text_IO.Put_Line(Ada.Strings.Unbounded.To_String(Source => L(I))); --
   --  end loop;                                                              --
   --  end main;                                                              --
   --                                                                         --
   --  Open terminal to see all colors.                                       --
   --  If you see symbols and numbers, it's not an error, It's -GnatStudio.   --
   --  Open the terminal.                                                     --
   -----------------------------------------------------------------------------
   Type test is array (1 .. 256) of Ada.Strings.Unbounded.Unbounded_String;
   L : Constant Test := (1  => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_0  & "Holaaaaa" & Reset),
                         2  => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_1  & "Holaaaaa" & Reset),
                         3  => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_2  & "Holaaaaa" & Reset),
                         4  => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_3  & "Holaaaaa" & Reset),
                         5  => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_4  & "Holaaaaa" & Reset),
                         6  => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_5  & "Holaaaaa" & Reset),
                         7  => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_6  & "Holaaaaa" & Reset),
                         8  => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_7  & "Holaaaaa" & Reset),
                         9  => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_8  & "Holaaaaa" & Reset),
                         10 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_9  & "Holaaaaa" & Reset),
                         11 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_10 & "Holaaaaa" & Reset),
                         12 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_11 & "Holaaaaa" & Reset),
                         13 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_12 & "Holaaaaa" & Reset),
                         14 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_13 & "Holaaaaa" & Reset),
                         15 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_14 & "Holaaaaa" & Reset),
                         16 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_15 & "Holaaaaa" & Reset),
                         17 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_16 & "Holaaaaa" & Reset),
                         18 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_17 & "Holaaaaa" & Reset),
                         19 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_18 & "Holaaaaa" & Reset),
                         20 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_19 & "Holaaaaa" & Reset),
                         21 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_20 & "Holaaaaa" & Reset),
                         22 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_21 & "Holaaaaa" & Reset),
                         23 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_22 & "Holaaaaa" & Reset),
                         24 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_23 & "Holaaaaa" & Reset),
                         25 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_24 & "Holaaaaa" & Reset),
                         26 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_25 & "Holaaaaa" & Reset),
                         27 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_26 & "Holaaaaa" & Reset),
                         28 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_27 & "Holaaaaa" & Reset),
                         29 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_28 & "Holaaaaa" & Reset),
                         30 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_29 & "Holaaaaa" & Reset),
                         31 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_30 & "Holaaaaa" & Reset),
                         32 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_31 & "Holaaaaa" & Reset),
                         33 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_32 & "Holaaaaa" & Reset),
                         34 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_33 & "Holaaaaa" & Reset),
                         35 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_34 & "Holaaaaa" & Reset),
                         36 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_35 & "Holaaaaa" & Reset),
                         37 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_36 & "Holaaaaa" & Reset),
                         38 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_37 & "Holaaaaa" & Reset),
                         39 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_38 & "Holaaaaa" & Reset),
                         40 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_39 & "Holaaaaa" & Reset),
                         41 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_40 & "Holaaaaa" & Reset),
                         42 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_41 & "Holaaaaa" & Reset),
                         43 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_42 & "Holaaaaa" & Reset),
                         44 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_43 & "Holaaaaa" & Reset),
                         45 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_44 & "Holaaaaa" & Reset),
                         46 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_45 & "Holaaaaa" & Reset),
                         47 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_46 & "Holaaaaa" & Reset),
                         48 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_47 & "Holaaaaa" & Reset),
                         49 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_48 & "Holaaaaa" & Reset),
                         50 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_49 & "Holaaaaa" & Reset),
                         51 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_50 & "Holaaaaa" & Reset),
                         52 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_51 & "Holaaaaa" & Reset),
                         53 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_52 & "Holaaaaa" & Reset),
                         54 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_53 & "Holaaaaa" & Reset),
                         55 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_54 & "Holaaaaa" & Reset),
                         56 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_55 & "Holaaaaa" & Reset),
                         57 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_56 & "Holaaaaa" & Reset),
                         58 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_57 & "Holaaaaa" & Reset),
                         59 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_58 & "Holaaaaa" & Reset),
                         60 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_59 & "Holaaaaa" & Reset),
                         61 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_60 & "Holaaaaa" & Reset),
                         62 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_61 & "Holaaaaa" & Reset),
                         63 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_62 & "Holaaaaa" & Reset),
                         64 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_63 & "Holaaaaa" & Reset),
                         65 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_64 & "Holaaaaa" & Reset),
                         66 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_65 & "Holaaaaa" & Reset),
                         67 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_66 & "Holaaaaa" & Reset),
                         68 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_67 & "Holaaaaa" & Reset),
                         69 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_68 & "Holaaaaa" & Reset),
                         70 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_69 & "Holaaaaa" & Reset),
                         71 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_70 & "Holaaaaa" & Reset),
                         72 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_71 & "Holaaaaa" & Reset),
                         73 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_72 & "Holaaaaa" & Reset),
                         74 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_73 & "Holaaaaa" & Reset),
                         75 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_74 & "Holaaaaa" & Reset),
                         76 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_75 & "Holaaaaa" & Reset),
                         77 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_76 & "Holaaaaa" & Reset),
                         78 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_77 & "Holaaaaa" & Reset),
                         79 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_78 & "Holaaaaa" & Reset),
                         80 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_79 & "Holaaaaa" & Reset),
                         81 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_80 & "Holaaaaa" & Reset),
                         82 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_81 & "Holaaaaa" & Reset),
                         83 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_82 & "Holaaaaa" & Reset),
                         84 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_83 & "Holaaaaa" & Reset),
                         85 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_84 & "Holaaaaa" & Reset),
                         86 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_85 & "Holaaaaa" & Reset),
                         87 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_86 & "Holaaaaa" & Reset),
                         88 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_87 & "Holaaaaa" & Reset),
                         89 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_88 & "Holaaaaa" & Reset),
                         90 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_89 & "Holaaaaa" & Reset),
                         91 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_90 & "Holaaaaa" & Reset),
                         92 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_91 & "Holaaaaa" & Reset),
                         93 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_92 & "Holaaaaa" & Reset),
                         94 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_93 & "Holaaaaa" & Reset),
                         95 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_94 & "Holaaaaa" & Reset),
                         96 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_95 & "Holaaaaa" & Reset),
                         97 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_96 & "Holaaaaa" & Reset),
                         98 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_97 & "Holaaaaa" & Reset),
                         99 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_98 & "Holaaaaa" & Reset),
                         100 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_99 & "Holaaaaa" & Reset),
                         101 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_100 & "Holaaaaa" & Reset),
                         102 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_101 & "Holaaaaa" & Reset),
                         103 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_102 & "Holaaaaa" & Reset),
                         104 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_103 & "Holaaaaa" & Reset),
                         105 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_104 & "Holaaaaa" & Reset),
                         106 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_105 & "Holaaaaa" & Reset),
                         107 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_106 & "Holaaaaa" & Reset),
                         108 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_107 & "Holaaaaa" & Reset),
                         109 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_108 & "Holaaaaa" & Reset),
                         110 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_109 & "Holaaaaa" & Reset),
                         111 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_110 & "Holaaaaa" & Reset),
                         112 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_111 & "Holaaaaa" & Reset),
                         113 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_112 & "Holaaaaa" & Reset),
                         114 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_113 & "Holaaaaa" & Reset),
                         115 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_114 & "Holaaaaa" & Reset),
                         116 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_115 & "Holaaaaa" & Reset),
                         117 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_116 & "Holaaaaa" & Reset),
                         118 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_117 & "Holaaaaa" & Reset),
                         119 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_118 & "Holaaaaa" & Reset),
                         120 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_119 & "Holaaaaa" & Reset),
                         121 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_120 & "Holaaaaa" & Reset),
                         122 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_121 & "Holaaaaa" & Reset),
                         123 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_122 & "Holaaaaa" & Reset),
                         124 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_123 & "Holaaaaa" & Reset),
                         125 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_124 & "Holaaaaa" & Reset),
                         126 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_125 & "Holaaaaa" & Reset),
                         127 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_126 & "Holaaaaa" & Reset),
                         128 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_127 & "Holaaaaa" & Reset),
                         129 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_128 & "Holaaaaa" & Reset),
                         130 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_129 & "Holaaaaa" & Reset),
                         131 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_130 & "Holaaaaa" & Reset),
                         132 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_131 & "Holaaaaa" & Reset),
                         133 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_132 & "Holaaaaa" & Reset),
                         134 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_133 & "Holaaaaa" & Reset),
                         135 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_134 & "Holaaaaa" & Reset),
                         136 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_135 & "Holaaaaa" & Reset),
                         137 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_136 & "Holaaaaa" & Reset),
                         138 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_137 & "Holaaaaa" & Reset),
                         139 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_138 & "Holaaaaa" & Reset),
                         140 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_139 & "Holaaaaa" & Reset),
                         141 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_140 & "Holaaaaa" & Reset),
                         142 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_141 & "Holaaaaa" & Reset),
                         143 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_142 & "Holaaaaa" & Reset),
                         144 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_143 & "Holaaaaa" & Reset),
                         145 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_144 & "Holaaaaa" & Reset),
                         146 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_145 & "Holaaaaa" & Reset),
                         147 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_146 & "Holaaaaa" & Reset),
                         148 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_147 & "Holaaaaa" & Reset),
                         149 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_148 & "Holaaaaa" & Reset),
                         150 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_149 & "Holaaaaa" & Reset),
                         151 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_150 & "Holaaaaa" & Reset),
                         152 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_151 & "Holaaaaa" & Reset),
                         153 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_152 & "Holaaaaa" & Reset),
                         154 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_153 & "Holaaaaa" & Reset),
                         155 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_154 & "Holaaaaa" & Reset),
                         156 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_155 & "Holaaaaa" & Reset),
                         157 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_156 & "Holaaaaa" & Reset),
                         158 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_157 & "Holaaaaa" & Reset),
                         159 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_158 & "Holaaaaa" & Reset),
                         160 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_159 & "Holaaaaa" & Reset),
                         161 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_160 & "Holaaaaa" & Reset),
                         162 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_161 & "Holaaaaa" & Reset),
                         163 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_162 & "Holaaaaa" & Reset),
                         164 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_163 & "Holaaaaa" & Reset),
                         165 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_164 & "Holaaaaa" & Reset),
                         166 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_165 & "Holaaaaa" & Reset),
                         167 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_166 & "Holaaaaa" & Reset),
                         168 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_167 & "Holaaaaa" & Reset),
                         169 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_168 & "Holaaaaa" & Reset),
                         170 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_169 & "Holaaaaa" & Reset),
                         171 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_170 & "Holaaaaa" & Reset),
                         172 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_171 & "Holaaaaa" & Reset),
                         173 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_172 & "Holaaaaa" & Reset),
                         174 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_173 & "Holaaaaa" & Reset),
                         175 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_174 & "Holaaaaa" & Reset),
                         176 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_175 & "Holaaaaa" & Reset),
                         177 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_176 & "Holaaaaa" & Reset),
                         178 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_177 & "Holaaaaa" & Reset),
                         179 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_178 & "Holaaaaa" & Reset),
                         180 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_179 & "Holaaaaa" & Reset),
                         181 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_180 & "Holaaaaa" & Reset),
                         182 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_181 & "Holaaaaa" & Reset),
                         183 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_182 & "Holaaaaa" & Reset),
                         184 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_183 & "Holaaaaa" & Reset),
                         185 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_184 & "Holaaaaa" & Reset),
                         186 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_185 & "Holaaaaa" & Reset),
                         187 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_186 & "Holaaaaa" & Reset),
                         188 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_187 & "Holaaaaa" & Reset),
                         189 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_188 & "Holaaaaa" & Reset),
                         190 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_189 & "Holaaaaa" & Reset),
                         191 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_190 & "Holaaaaa" & Reset),
                         192 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_191 & "Holaaaaa" & Reset),
                         193 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_192 & "Holaaaaa" & Reset),
                         194 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_193 & "Holaaaaa" & Reset),
                         195 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_194 & "Holaaaaa" & Reset),
                         196 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_195 & "Holaaaaa" & Reset),
                         197 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_196 & "Holaaaaa" & Reset),
                         198 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_197 & "Holaaaaa" & Reset),
                         199 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_198 & "Holaaaaa" & Reset),
                         200 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_199 & "Holaaaaa" & Reset),
                         201 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_200 & "Holaaaaa" & Reset),
                         202 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_201 & "Holaaaaa" & Reset),
                         203 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_202 & "Holaaaaa" & Reset),
                         204 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_203 & "Holaaaaa" & Reset),
                         205 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_204 & "Holaaaaa" & Reset),
                         206 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_205 & "Holaaaaa" & Reset),
                         207 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_206 & "Holaaaaa" & Reset),
                         208 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_207 & "Holaaaaa" & Reset),
                         209 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_208 & "Holaaaaa" & Reset),
                         210 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_209 & "Holaaaaa" & Reset),
                         211 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_210 & "Holaaaaa" & Reset),
                         212 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_211 & "Holaaaaa" & Reset),
                         213 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_212 & "Holaaaaa" & Reset),
                         214 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_213 & "Holaaaaa" & Reset),
                         215 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_214 & "Holaaaaa" & Reset),
                         216 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_215 & "Holaaaaa" & Reset),
                         217 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_216 & "Holaaaaa" & Reset),
                         218 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_217 & "Holaaaaa" & Reset),
                         219 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_218 & "Holaaaaa" & Reset),
                         220 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_219 & "Holaaaaa" & Reset),
                         221 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_220 & "Holaaaaa" & Reset),
                         222 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_221 & "Holaaaaa" & Reset),
                         223 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_222 & "Holaaaaa" & Reset),
                         224 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_223 & "Holaaaaa" & Reset),
                         225 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_224 & "Holaaaaa" & Reset),
                         226 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_225 & "Holaaaaa" & Reset),
                         227 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_226 & "Holaaaaa" & Reset),
                         228 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_227 & "Holaaaaa" & Reset),
                         229 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_228 & "Holaaaaa" & Reset),
                         230 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_229 & "Holaaaaa" & Reset),
                         231 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_230 & "Holaaaaa" & Reset),
                         232 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_231 & "Holaaaaa" & Reset),
                         233 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_232 & "Holaaaaa" & Reset),
                         234 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_233 & "Holaaaaa" & Reset),
                         235 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_234 & "Holaaaaa" & Reset),
                         236 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_235 & "Holaaaaa" & Reset),
                         237 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_236 & "Holaaaaa" & Reset),
                         238 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_237 & "Holaaaaa" & Reset),
                         239 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_238 & "Holaaaaa" & Reset),
                         240 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_239 & "Holaaaaa" & Reset),
                         241 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_240 & "Holaaaaa" & Reset),
                         242 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_241 & "Holaaaaa" & Reset),
                         243 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_242 & "Holaaaaa" & Reset),
                         244 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_243 & "Holaaaaa" & Reset),
                         245 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_244 & "Holaaaaa" & Reset),
                         246 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_245 & "Holaaaaa" & Reset),
                         247 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_246 & "Holaaaaa" & Reset),
                         248 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_247 & "Holaaaaa" & Reset),
                         249 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_248 & "Holaaaaa" & Reset),
                         250 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_249 & "Holaaaaa" & Reset),
                         251 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_250 & "Holaaaaa" & Reset),
                         252 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_251 & "Holaaaaa" & Reset),
                         253 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_252 & "Holaaaaa" & Reset),
                         254 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_253 & "Holaaaaa" & Reset),
                         255 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_254 & "Holaaaaa" & Reset),
                         256 => Ada.Strings.Unbounded.To_Unbounded_String(Source => B_255 & "Holaaaaa" & Reset));
end terminal_table_colors;
