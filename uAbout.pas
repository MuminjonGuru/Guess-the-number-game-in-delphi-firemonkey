{ ***************************************************************
  **     Copyright 2017 Abduraimov Mo'minjon - www.Delphi.uz    **
  **                                                            **
  **             Simple Guessing Number Game.                   **
  **                                                            **
  **     https://www.DELPHI.uz  &  mr.delphiguru@gmail.com      **
  **                 Twitter - @MrDelphiGuru                    **
  **************************************************************** }

unit uAbout;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Ani, FMX.Advertising, FMX.Objects,
  {$IFDEF Android}
  Androidapi.Jni.GraphicsContentViewText, Androidapi.Jni.App,
  Androidapi.Jni.Net,
  Androidapi.Helpers;
  {$ENDIF}

type
  TFormAbout = class(TForm)
    LayoutAbout: TLayout;
    ToolBarTop: TToolBar;
    BtnBack: TButton;
    BtnMoreApps: TButton;
    BannerAd1: TBannerAd;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    LayoutSocialNetwork: TLayout;
    CircleFacebook: TCircle;
    CircleTwitter: TCircle;
    procedure BtnBackClick(Sender: TObject);
    procedure BtnMoreAppsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CircleFacebookClick(Sender: TObject);
    procedure CircleTwitterClick(Sender: TObject);
  private
    { Private declarations }
    procedure OpenURL(S: String);
  public
    { Public declarations }
  end;

var
  FormAbout: TFormAbout;

implementation

{$R *.fmx}

procedure TFormAbout.OpenURL(S: string);
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

procedure TFormAbout.BtnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TFormAbout.BtnMoreAppsClick(Sender: TObject);
begin
  OpenURL('https://www.delphi.uz');
end;

procedure TFormAbout.Button1Click(Sender: TObject);
begin
  OpenURL('https://www.delphi.uz');
end;

procedure TFormAbout.CircleFacebookClick(Sender: TObject);
begin
  OpenURL('https://www.facebook.com/wwwdelphiuz/?ref=bookmarks');
end;

procedure TFormAbout.CircleTwitterClick(Sender: TObject);
begin
  OpenURL('https://twitter.com/MrDelphiGuru');
end;

procedure TFormAbout.FormCreate(Sender: TObject);
begin
  BannerAd1.AdUnitID := 'ca-app-pub-7303908544500004/1694249778';
end;

procedure TFormAbout.FormShow(Sender: TObject);
begin
  BannerAd1.LoadAd;
end;

end.
