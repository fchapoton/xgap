#############################################################################
##
#W  sheet.gd                  	XGAP library                     Frank Celler
##
#H  @(#)$Id: sheet.gd,v 1.2 1997/12/08 21:48:11 frank Exp $
##
#Y  Copyright 1995-1997,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
#Y  Copyright 1997,       Frank Celler,                 Huerth,       Germany
##
##  This file contains all operations for graphic sheets.
##


#############################################################################
##

#C  IsGraphicWindow . . . . . . . . . . . . . . . . . .   category of windows
##
IsGraphicWindow := NewCategory(
    "IsGraphicWindow",
    IsObject );


#############################################################################
##
#O  GraphicWindow( <catrep>, <name>, <width>, <height> ) a new graphic window
##
GraphicWindow := NewOperation(
    "GraphicWindow",
    [ IsObject, IsString, IsInt, IsInt ] );


#############################################################################
##
#V  GraphicWindowsFamily  . . . . . . . . . . . . . . . family of all windows
##
GraphicWindowsFamily := NewFamily( "GraphicWindowsFamily" );


#############################################################################
##

#C  IsGraphicSheet  . . . . . . . . . . . . . . .  category of graphic sheets
##
IsGraphicSheet := NewCategory(
    "IsGraphicSheet",
    IsGraphicWindow );


#############################################################################
##
#O  GraphicSheet( <name>, <width>, <height> ) . . . . . . a new graphic sheet
##
##  creates  a  graphic  sheet with  title  <name>  and dimension <width>  by
##  <height>.  A graphic sheet  is the basic  tool  to draw something,  it is
##  like a piece of  paper on which you can  put your graphic objects, and to
##  which you  can attach your  menus.   The coordinate $(0,0)$ is  the upper
##  left corner, $(<width>,<height>)$ the lower right.
##
##  It is  possible to  change the default   behaviour of a graphic sheet  by
##  installing methods (or   sometimes  called callbacks) for the   following
##  events.  For example to install  the function `MyLeftPBDown' as  callback
##  for the left mouse button  down event of a  graphic <sheet>, you have  to
##  call `InstallCallback' as follows.
##
##  \begintt
##      gap> InstallCallback( sheet, "LeftPBDown", MyLeftPBDown );
##  \endtt
##
##  `Close( <sheet> )':
##    the function will be called as soon  as the user selects <close graphic
##    sheet>,  the installed   function gets  the graphic <sheet> to close as
##    argument.
##
##  `LeftPBDown( <sheet>, <x>, <y> )':
##    the function will be called as soon as  the user presses the left mouse
##    button inside  the   graphic sheet, the  installed   function  gets the
##    graphic <sheet>,  the <x> coordinate and  <y> coordinate of the pointer
##    as arguments.
##    
##  `RightPBDown( <sheet>, <x>, <y> )':
##    same  as `LeftPBDown' except that the  user has pressed the right mouse
##    button.
##
##  `ShiftLeftPBDown( <sheet>, <x>, <y> )':
##    same  as 'LeftPBDown' except that the  user has  pressed the left mouse
##    button together with the <SHIFT> key on the keyboard.
##
##  `ShiftRightPBDown( <sheet>, <x>, <y> )':
##    same as  'LeftPBDown' except that the  user has pressed the right mouse
##    button together with the <SHIFT> key on the keyboard.
##
##  `CtrlLeftPBDown( <sheet>, <x>, <y> )':
##    same  as 'LeftPBDown' except that the  user has pressed  the left mouse
##    button together with the <CTR> key on the keyboard.
##
##  `CtrlRightPBDown( <sheet>, <x>, <y> )':
##    same as 'LeftPBDown'  except that the  user has pressed the right mouse
##    button together with the <CTR> key on the keyboard.
##
GraphicSheet := NewOperation(
    "GraphicSheet",
    [ IsString, IsInt, IsInt ] );


#############################################################################
##
#O  Close( <sheet> )  . . . . . . . . . . . . . . . .  create a graphic sheet
##
Close := NewOperation(
    "Close",
    [ IsGraphicSheet ] );


#############################################################################
##
#A  WindowId( <sheet> ) . . . . . . . . . . . . . . . .  window id of <sheet>
##
WindowId := NewAttribute(
    "WindowId",
    IsGraphicSheet );

HasWindowId := Tester(WindowId);
SetWindowId := Setter(WindowId);


#############################################################################
##
#A  DefaultsForGraphicObject( <sheet> ) . . . . . . . . .  default color, etc
##
DefaultsForGraphicObject := NewAttribute(
    "DefaultsForGraphicObject",
    IsGraphicSheet );

HasDefaultsForGraphicObject := Tester(DefaultsForGraphicObject);
SetDefaultsForGraphicObject := Setter(DefaultsForGraphicObject);


#############################################################################
##

#F  UseFastUpdate . . . . . . . . . . . . . . . . . .  filter for fast update
##
UseFastUpdate := NewFilter( "UseFastUpdate" );
HasFastUpdate := Tester(UseFastUpdate);


#############################################################################
##

#E  sheet.gd  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
##
