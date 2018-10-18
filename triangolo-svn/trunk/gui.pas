{ Triangolo }

{ Version 1.0 (Agavi) }

{ (c) Johannes W. Dietrich, 2012 - 2018 }
{ (c) Ruhr University of Bochum 2012 - 2018 }

{ GUI }

{ Source code released under the BSD License }

{ See the file "license.txt", included in this distribution, }
{ for details about the copyright. }
{ Current versions and additional information are available from }
{ http://puma-repository.sf.net }

{ This program is distributed in the hope that it will be useful, }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. }

unit GUI;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Spin, StdCtrls,
  ExtCtrls, ComCtrls, Menus, DividerBevel, LCLType, ActnList, StdActns,
  Calculator;

const
  kAboutMessage = 'Triangolo by JWD 2018';

type

  { TTriangoloMainForm }

  TTriangoloMainForm = class(TForm)
    ActionList1: TActionList;
    AppleMenu: TMenuItem;
    CalculateButton: TButton;
    CloseMenuItem: TMenuItem;
    CopyMenuItem: TMenuItem;
    CutMenuItem: TMenuItem;
    Divider11: TMenuItem;
    Divider12: TMenuItem;
    Divider21: TMenuItem;
    DividerBevel1: TDividerBevel;
    EditCopy1: TEditCopy;
    EditCut1: TEditCut;
    EditDelete1: TEditDelete;
    EditMenu: TMenuItem;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    FileMenu: TMenuItem;
    FinalLT4DoseEdit: TEdit;
    FinalLT3DoseEdit: TEdit;
    FinalLT4DoseGroupBox: TGroupBox;
    FinalLT3DoseGroupBox: TGroupBox;
    FinalLT4DoseLabel: TLabel;
    FinalLT3DoseLabel: TLabel;
    FinalLT4UnitLabel1: TLabel;
    FinalLT3UnitLabel: TLabel;
    HelpMenu: TMenuItem;
    HintGroupBox: TGroupBox;
    MacAboutItem: TMenuItem;
    MainMenu1: TMainMenu;
    RecommendationMemo: TMemo;
    MethodLabel: TLabel;
    MethodComboBox: TComboBox;
    IntialLT4UnitLabel: TLabel;
    InitialLT4DoseLabel: TLabel;
    NewMenuItem: TMenuItem;
    OpenMenuItem: TMenuItem;
    ParameterGroupBox: TGroupBox;
    InitialLT4DoseFloatSpinEdit: TFloatSpinEdit;
    PasteMenuItem: TMenuItem;
    QuitMenuItem: TMenuItem;
    RedoMenuItem: TMenuItem;
    SaveMenuItem: TMenuItem;
    StatusBar1: TStatusBar;
    UndoMenuItem: TMenuItem;
    WinAboutItem: TMenuItem;
    procedure AdaptMenus;
    procedure CalculateButtonClick(Sender: TObject);
    procedure CloseMenuItemClick(Sender: TObject);
    procedure EditCopy1Execute(Sender: TObject);
    procedure EditCut1Execute(Sender: TObject);
    procedure EditDelete1Execute(Sender: TObject);
    procedure EditPaste1Execute(Sender: TObject);
    procedure EditSelectAll1Execute(Sender: TObject);
    procedure EditUndo1Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MacAboutItemClick(Sender: TObject);
    procedure QuitMenuItemClick(Sender: TObject);
    procedure WinAboutItemClick(Sender: TObject);
  private

  public
    Recommendation: TDoseRecord;
  end;

var
  TriangoloMainForm: TTriangoloMainForm;

implementation

{$R *.lfm}

{ TTriangoloMainForm }

procedure TTriangoloMainForm.AdaptMenus;
{ Adapts Menus and Shortcuts to the interface style guidelines
  of the respective operating system }
var
  modifierKey: TShiftState;
begin
  {$IFDEF LCLcarbon}
  modifierKey := [ssMeta];
  WinAboutItem.Visible := False;
  AppleMenu.Visible := True;
  {$ELSE}
  modifierKey := [ssCtrl];
  WinAboutItem.Visible := True;
  AppleMenu.Visible := False;
  {$ENDIF}
  NewMenuItem.ShortCut := ShortCut(VK_N, modifierKey);
  OpenMenuItem.ShortCut := ShortCut(VK_O, modifierKey);
  CloseMenuItem.ShortCut := ShortCut(VK_W, modifierKey);
  SaveMenuItem.ShortCut := ShortCut(VK_S, modifierKey);
  QuitMenuItem.ShortCut := ShortCut(VK_Q, modifierKey);
  UndoMenuItem.ShortCut := ShortCut(VK_Z, modifierKey);
  RedoMenuItem.ShortCut := ShortCut(VK_Z, modifierKey + [ssShift]);
  CutMenuItem.ShortCut := ShortCut(VK_X, modifierKey);
  CopyMenuItem.ShortCut := ShortCut(VK_C, modifierKey);
  PasteMenuItem.ShortCut := ShortCut(VK_V, modifierKey);
end;

procedure TTriangoloMainForm.CalculateButtonClick(Sender: TObject);
var
  selectedMethod: TMethod;
begin
  case MethodComboBox.ItemIndex of
    0: selectedMethod := ETA_A;
    1: selectedMethod := ETA_B1;
    2: selectedMethod := ETA_B2;
    3: selectedMethod := ETA_C;
  otherwise
    selectedMethod := None;
  end;
  Recommendation := FinalDose(InitialLT4DoseFloatSpinEdit.Value, selectedMethod);
  FinalLT4DoseEdit.Text := FloatToStrF(Recommendation.LT4Dose, ffNumber, 1, 1);
  FinalLT3DoseEdit.Text := FloatToStrF(Recommendation.LT3Dose, ffNumber, 1, 1);
end;

procedure TTriangoloMainForm.CloseMenuItemClick(Sender: TObject);
begin
  QuitMenuItemClick(Sender);
end;

procedure TTriangoloMainForm.EditCopy1Execute(Sender: TObject);
begin
  InitialLT4DoseFloatSpinEdit.CopyToClipboard;
end;

procedure TTriangoloMainForm.EditCut1Execute(Sender: TObject);
begin
  InitialLT4DoseFloatSpinEdit.Clear;
end;

procedure TTriangoloMainForm.EditDelete1Execute(Sender: TObject);
begin
  InitialLT4DoseFloatSpinEdit.Clear;
end;

procedure TTriangoloMainForm.EditPaste1Execute(Sender: TObject);
begin
  InitialLT4DoseFloatSpinEdit.PasteFromClipboard;
end;

procedure TTriangoloMainForm.EditSelectAll1Execute(Sender: TObject);
begin
  InitialLT4DoseFloatSpinEdit.SelectAll;
end;

procedure TTriangoloMainForm.EditUndo1Execute(Sender: TObject);
begin
  InitialLT4DoseFloatSpinEdit.Undo;
end;

procedure TTriangoloMainForm.FormCreate(Sender: TObject);
begin
  AdaptMenus;
end;

procedure TTriangoloMainForm.MacAboutItemClick(Sender: TObject);
begin
  ShowMessage(kAboutMessage);
end;

procedure TTriangoloMainForm.QuitMenuItemClick(Sender: TObject);
begin
  application.Terminate;
end;

procedure TTriangoloMainForm.WinAboutItemClick(Sender: TObject);
begin
  MacAboutItemClick(Sender);
end;

end.
