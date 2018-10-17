unit GUI;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Spin, StdCtrls,
  ExtCtrls, ComCtrls, DividerBevel, Calculator;

type

  { TTriangoloMainForm }

  TTriangoloMainForm = class(TForm)
    CalculateButton: TButton;
    DividerBevel1: TDividerBevel;
    FinalLT4DoseEdit: TEdit;
    FinalLT3DoseEdit: TEdit;
    FinalLT4DoseGroupBox: TGroupBox;
    FinalLT3DoseGroupBox: TGroupBox;
    FinalLT4DoseLabel: TLabel;
    FinalLT3DoseLabel: TLabel;
    FinalLT4UnitLabel1: TLabel;
    FinalLT3UnitLabel: TLabel;
    HintGroupBox: TGroupBox;
    MethodLabel: TLabel;
    MethodComboBox: TComboBox;
    IntialLT4UnitLabel: TLabel;
    InitialLT4DoseLabel: TLabel;
    ParameterGroupBox: TGroupBox;
    InitialLT4DoseFloatSpinEdit: TFloatSpinEdit;
    StatusBar1: TStatusBar;
    procedure CalculateButtonClick(Sender: TObject);
  private

  public
    Recommendation: TDoseRecord;
  end;

var
  TriangoloMainForm: TTriangoloMainForm;

implementation

{$R *.lfm}

{ TTriangoloMainForm }

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

end.

