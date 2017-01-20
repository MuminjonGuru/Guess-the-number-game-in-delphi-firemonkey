program Guess_thenumber;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {FormMain},
  uGameBoard in 'uGameBoard.pas' {FormGameBoard},
  uAbout in 'uAbout.pas' {FormAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait, TFormOrientation.InvertedPortrait];
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
