{ Triangolo }

{ Version 1.0 (Agavi) }

{ (c) Johannes W. Dietrich, 2012 - 2020 }
{ (c) Ruhr University of Bochum 2012 - 2020 }

{ Calculating engine }

{ Source code released under the BSD License }

{ See the file "license.txt", included in this distribution, }
{ for details about the copyright. }
{ Current versions and additional information are available from }
{ http://triangolo.sf.net }

{ This program is distributed in the hope that it will be useful, }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. }

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
  case method of
  ETA_A:
  begin
    y := x / 17;
    z := x - 3 * y;
    result.LT3Dose := y;
    result.LT4Dose := z;
  end;
  ETA_B1:
  begin
    y := 0.8 * x / 17;
    z := 16 * y * 1.25;
    result.LT3Dose := y;
    result.LT4Dose := z;
  end;
  ETA_B2:
  begin
    y := 0.7 * x / 17;
    z := 16 * y * 1.43;
    result.LT3Dose := y;
    result.LT4Dose := z;
  end;
  ETA_C:
  begin
    y := x / 20;
    z := x - 3 * y;
    result.LT3Dose := y;
    result.LT4Dose := z;
  end;
  otherwise
  begin
    result.LT3Dose := NaN;
    result.LT4Dose := NaN;
  end;
  end;
end;

end.

