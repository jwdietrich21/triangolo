program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, lazcontrols, GUI
  { you can add units after this };

{$R *.res}

begin
  Application.Title := 'Triangolo';
  RequireDerivedFormResource := True;
  Application.Scaled := True;
  Application.Initialize;
  Application.CreateForm(TTriangoloMainForm, TriangoloMainForm);
  Application.Run;
end.

