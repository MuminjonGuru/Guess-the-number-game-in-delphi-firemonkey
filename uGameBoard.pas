{ ***************************************************************
  **     Copyright 2017 Abduraimov Mo'minjon - www.Delphi.uz    **
  **                                                            **
  **             Simple Guessing Number Game.                   **
  **                                                            **
  **     https://www.DELPHI.uz  &  mr.delphiguru@gmail.com      **
  **                 Twitter - @MrDelphiGuru                    **
  **************************************************************** }

unit uGameBoard;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.TabControl, FMX.Advertising, FMX.Objects,
  System.IOUtils, FMX.Edit, FMX.DialogService.Async, System.Actions,
  FMX.ActnList, FMX.StdActns, FMX.MediaLibrary.Actions;

type
  TFormGameBoard = class(TForm)
    ToolBarTop: TToolBar;
    BtnBack: TButton;
    TabControl1: TTabControl;
    TabItemGB: TTabItem;
    BannerAd1: TBannerAd;
    TabItemHint: TTabItem;
    Image1: TImage;
    BtnPlay: TButton;
    Label1: TLabel;
    EditNumber: TEdit;
    BtnCheck: TButton;
    Button1: TButton;
    ActionList1: TActionList;
    ShowShareSheetAction1: TShowShareSheetAction;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnPlayClick(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure BtnCheckClick(Sender: TObject);
    procedure ShowShareSheetAction1BeforeExecute(Sender: TObject);
  private
    { Private declarations }
    X: Byte; // Random number
    Y: Byte; // User inputted number
    Turns: Byte; // how many turns it takes you to win
    procedure ShowMsg(S: String);
  public
    { Public declarations }
  end;

var
  FormGameBoard: TFormGameBoard;

implementation

{$R *.fmx}

procedure TFormGameBoard.BtnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TFormGameBoard.BtnPlayClick(Sender: TObject);
begin
  TabItemGB.Visible := True; // Show Game board
  TabControl1.ActiveTab := TabItemGB; // now, active tab is game board tab.
end;

procedure TFormGameBoard.BtnCheckClick(Sender: TObject);
begin
  if EditNumber.Text = '' then
  begin
    ShowMsg('Please, input any number!');
  end
  else
  begin
    Y := StrToInt(EditNumber.Text);
    if (X > Y) then
    begin
      Inc(Turns);
      ShowMsg('Your guess, ' + IntToStr(Y) + ', is low');
      EditNumber.Text := '';
    end
    else if (X < Y) then
    begin
      Inc(Turns);
      ShowMsg('Your guess, ' + IntToStr(Y) + ', is high');
      EditNumber.Text := '';
    end
    Else
    begin
      Inc(Turns);
      ShowMsg('Your guess, ' + IntToStr(Y) + ', is matched!' + #13 + 'Turns: ' +
        IntToStr(Turns));

      Turns := 0; // zero
      EditNumber.Text := '';
      X := Random(10);
    end;
  end;
end;

procedure TFormGameBoard.FormCreate(Sender: TObject);
begin
  Randomize;
  X := Random(10); // random number
  Turns := 0;

  BannerAd1.AdUnitID := 'ca-app-pub-7303908544500004/1694249778'; // AdMob ad ID

  // Load image from external storage
  Image1.Bitmap.LoadFromFile((TPath.Combine(TPath.GetDocumentsPath,
    'howtoplay.jpg')));

  TabItemGB.Visible := False; //
  TabControl1.ActiveTab := TabItemHint;
end;

procedure TFormGameBoard.FormShow(Sender: TObject);
begin
  BannerAd1.LoadAd;
end;

procedure TFormGameBoard.ShowMsg(S: String);
begin
  TDialogServiceAsync.MessageDialog(S, System.UITypes.TMsgDlgType.mtInformation,
    [System.UITypes.TMsgDlgBtn.mbOk], System.UITypes.TMsgDlgBtn.mbOk, 0,
    procedure(const AResult: TModalResult)
    begin
    end);
end;

procedure TFormGameBoard.ShowShareSheetAction1BeforeExecute(Sender: TObject);
begin
  ShowShareSheetAction1.TextMessage :=
    'Learn Delphi programming language with https://delphi.uz web-site';
end;

end.
