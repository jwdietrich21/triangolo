unit GUIServices;

{ Triangolo }

{ Version 1.0 (Agavi) }

{ (c) Johannes W. Dietrich, 2012 - 2022 }
{ (c) Ruhr University of Bochum 2012 - 2022 }

{ Main project file }

{ Source code released under the BSD License }

{ See the file "license.txt", included in this distribution, }
{ for details about the copyright. }
{ Current versions and additional information are available from }
{ http://triangolo.sf.net }

{ This program is distributed in the hope that it will be useful, }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. }

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, gettext
  {$IFDEF WINDOWS}
  , Windows, Win32Proc, registry
  {$ENDIF}
  {$IFDEF DARWIN}
  , MacOSAll
  {$ENDIF}
  {$IFDEF LCLCocoa}
  , CocoaAll, CocoaUtils
  {$ENDIF}
  {$IFDEF UNIX}
  , Unix
  {$ENDIF}
  , EnvironmentInfo;

type
  tInterfaceLanguage = (English, German, other);
  tLocalString = array[0..1] of string;

const
  kParameterGroup: tLocalString = ('Parameters', 'Parameter');
  kInitialLT4Dosage: tLocalString =
    ('Initial L-T4 Dosage:', 'Initiale L-T4-Dosis:');
  kUnitLabel: tLocalString = ('µg/day', 'µg/Tag');
  kMethodCaption: tLocalString = ('Method of Calculation:', 'Berechnungsmethode:');
  kMethod: tLocalString = ('ETA Method', 'ETA-Methode');
  kFinalDosage: TLocalString =
    ('Final Dosages:', 'Endgültige Dosierungen:');
  kFinalLT4Dosage: tLocalString =
    ('Final L-T4 dosage:', 'Endgültige L-T4-Dosis:');
  kFinalLT3Dosage: tLocalString =
    ('Final L-T3 dosage:', 'Endgültige L-T3-Dosis:');
  kHint: tLocalString = ('Hints:', 'Hinweise:');
  kFileMenu: tLocalString = ('File', 'Ablage');
  kNewItem: tLocalString = ('New', 'Neu');
  kOpenItem: tLocalString = ('Open', 'Öffnen');
  kSaveItem: tLocalString = ('Save', 'Sichern');
  kCloseItem: tLocalString = ('Close', 'Schließen');
  kQuitItem: tLocalString = ('Quit', 'Beenden');
  kEditMenu: tLocalString = ('Edit', 'Bearbeiten');
  kUndoItem: tLocalString = ('Undo', 'Widerrufen');
  kRedoItem: tLocalString = ('Redo', 'Wiederholen');
  kCutItem: tLocalString = ('Cut', 'Ausschneiden');
  kCopyItem: tLocalString = ('Copy', 'Kopieren');
  kPasteItem: tLocalString = ('Paste', 'Einfügen');
  kHelpMenu: tLocalString = ('Help', 'Hilfe');
  kAboutItem: tLocalString = ('About Triangolo', 'Über Triangolo');
  kInfoCaption: tLocalString = ('About Triangolo', 'Über Triangolo');
  kCoopCaption: TLocalString = ('In cooperation with:', 'In Kooperation mit:');

function GetOSLanguage: tInterfaceLanguage;

implementation

function GetOSLanguage: tInterfaceLanguage;
  {platform-independent method to read the language of the user interface}
var
  l, fbl: string;
  {$IFDEF Darwin}
  theLocaleRef: CFLocaleRef;
  locale: CFStringRef;
  buffer: StringPtr;
  bufferSize: CFIndex;
  encoding: CFStringEncoding;
  success: boolean;
  {$ENDIF}
begin
  {$IFDEF Darwin}
  theLocaleRef := CFLocaleCopyCurrent;
  locale := CFLocaleGetIdentifier(theLocaleRef);
  encoding := 0;
  bufferSize := 256;
  buffer := new(StringPtr);
  success := CFStringGetPascalString(locale, buffer, bufferSize, encoding);
  if success then
    l := string(buffer^)
  else
    l := '';
  fbl := Copy(l, 1, 2);
  dispose(buffer);
  {$ELSE}
  {$IFDEF UNIX}
  fbl := Copy(GetEnvironmentVariable('LC_CTYPE'), 1, 2);
    {$ELSE}
  GetLanguageIDs(l, fbl);
    {$ENDIF}
  {$ENDIF}
  if lowercase(fbl) = 'en' then
    result := English
  else if lowercase(fbl) = 'de' then
    result := German
  else
    result := other;
end;

end.

