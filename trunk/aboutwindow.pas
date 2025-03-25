unit AboutWindow;

{ Triangolo }

{ Version 1.0 (Agavi) }

{ (c) Johannes W. Dietrich, 2012 - 2022 }
{ (c) Ruhr University of Bochum 2012 - 2022 }

{ Handler for About window }

{ Source code released under the BSD License }

{ See the file "license.txt", included in this distribution, }
{ for details about the copyright. }
{ Current versions and additional information are available from }
{ http://triangolo.sf.net }

{ This program is distributed in the hope that it will be useful, }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. }

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  LCLIntf, EnvironmentInfo, GUIServices;

type

  { TAboutForm }

  TAboutForm = class(TForm)
    CopyrightLabel8: TLabel;
    TriangoloLogo: TImage;
    OKButton: TButton;
    CopyrightLabel1: TLabel;
    CopyrightLabel2: TLabel;
    CopyrightLabel3: TLabel;
    CopyrightLabel6: TLabel;
    CopyrightLabel7: TLabel;
    TriangoloURL: TLabel;
    VersionLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure AdaptLanguages;
    procedure OKButtonClick(Sender: TObject);
    procedure TriangoloURLClick(Sender: TObject);
  private

  public

  end;

var
  AboutForm: TAboutForm;

implementation

{$R *.lfm}

{ TAboutForm }

procedure TAboutForm.FormCreate(Sender: TObject);
begin
  VersionLabel.Caption := 'Version ' + FileVersion;
  {$IFDEF LCLCocoa}
  Color := clDefault;
  {$ENDIF}
  AdaptLanguages;
end;

procedure TAboutForm.AdaptLanguages;
var
  theLanguage: tInterfaceLanguage;
  s: integer;
begin
  s := 0;
  theLanguage := GetOSLanguage;
  if theLanguage = German then
    s := 1;
  caption := kInfoCaption[s];
  CopyrightLabel3.Caption := kCoopCaption[s];
end;

procedure TAboutForm.OKButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TAboutForm.TriangoloURLClick(Sender: TObject);
begin
  OpenURL('http://triangolo.sourceforge.net')
end;

end.

