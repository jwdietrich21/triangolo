unit Calculator;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Math;

type
  TDoseRecord = record
    LT4Dose, LT3Dose: real;
  end;

  TMethod = (None, ETA_A, ETA_B1, ETA_B2, ETA_C);

function FinalDose(x: real; method: TMethod): TDoseRecord;

implementation

function FinalDose(x: real; method: TMethod): TDoseRecord;
var
  y, z: real;
begin
  y := x / 20;
  z := x - 3 * y;
  result.LT3Dose := y;
  result.LT4Dose := z;
end;

end.

