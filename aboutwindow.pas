{ Triangolo }

{ Version 1.0 (Agavi) }

{ (c) Johannes W. Dietrich, 2012 - 2019 }
{ (c) Ruhr University of Bochum 2012 - 2019 }

{ Handler for About window }

{ Source code released under the BSD License }

{ See the file "license.txt", included in this distribution, }
{ for details about the copyright. }
{ Current versions and additional information are available from }
{ http://triangolo.sf.net }

{ This program is distributed in the hope that it will be useful, }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. }

unit AboutWindow;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  LCLIntf, VersionSupport;

type

  { TAboutForm }

  TAboutForm = class(TForm)
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
  VersionLabel.Caption := 'Version ' + GetFileVersion;
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

