{***************************************************************
**     Copyright 2017 Abduraimov Mo'minjon - www.Delphi.uz    **
**                                                            **
**             Simple Guessing Number Game.                   **
**                                                            **
**     https://www.DELPHI.uz  &  mr.delphiguru@gmail.com      **
**                 Twitter - @MrDelphiGuru                    **
****************************************************************}

unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Advertising, FMX.Layouts, System.Actions,
  FMX.ActnList, FMX.StdActns, FMX.MediaLibrary.Actions, FMX.DialogService.Async,
  {$IFDEF Android}
  Androidapi.Jni.GraphicsContentViewText, Androidapi.Jni.App,
  Androidapi.Jni.Net,
  Androidapi.Helpers;
  {$ENDIF}

type
  TFormMain = class(TForm)
    ToolBarTop: TToolBar;
    BtnInfo: TButton;
    BtnShare: TButton;
    BannerAd1: TBannerAd;
    Layout1: TLayout;
    BtnEasy: TButton;
    BtnMedium: TButton;
    BtnHard: TButton;
    ActionList1: TActionList;
    ShowShareSheetAction1: TShowShareSheetAction;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ShowShareSheetAction1BeforeExecute(Sender: TObject);
    procedure BtnEasyClick(Sender: TObject);
    procedure BtnInfoClick(Sender: TObject);
    procedure BtnMediumClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenURL(S: String);
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

Uses
  uGameBoard, uAbout;

procedure TFormMain.BtnEasyClick(Sender: TObject);
begin
  if FormGameBoard = Nil then
    FormGameBoard := TFormGameBoard.Create(Application);
  if FormGameBoard.TabItemGB.Visible = True then
    FormGameBoard.TabControl1.ActiveTab := FormGameBoard.TabItemGB;
  FormGameBoard.Show;
end;

procedure TFormMain.BtnInfoClick(Sender: TObject);
begin
  if FormAbout = Nil then
    FormAbout := TFormAbout.Create(Application);
  FormAbout.Show;
end;

procedure TFormMain.BtnMediumClick(Sender: TObject);
begin
  ShowMessage('www.Delphi.uz');
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  BannerAd1.AdUnitID := 'ca-app-pub-7303908544500004/1694249778';
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  BannerAd1.LoadAd;
end;

procedure TFormMain.OpenURL(S: String);
{$IFDEF Android}
var
  Intent: JIntent;
begin
  Intent := TJIntent.Create;
  Intent.setAction(TJIntent.JavaClass.ACTION_VIEW);
  Intent.setData(StrToJURI(S));
  TAndroidHelper.Activity.startActivity(Intent);
{$ENDIF}
end;

procedure TFormMain.ShowShareSheetAction1BeforeExecute(Sender: TObject);
begin
  ShowShareSheetAction1.TextMessage :=
    'Learn Delphi Programming Language with https://www.delphi.uz !!';
end;

end.
