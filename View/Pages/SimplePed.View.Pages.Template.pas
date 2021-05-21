unit SimplePed.View.Pages.Template;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.WinXPanels, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, SimpleAttributes,
  SimplePed.Controller.Interfaces, Vcl.DBCtrls;

type
  TForm1 = class(TForm)
    [Bind('ID')]
    edtID: TEdit;
    [Bind('DATA')]
    dtpData: TDateTimePicker;

    CardPanel1: TCardPanel;
    Panel10: TPanel;
    DBGrid1: TDBGrid;
    Card1: TCard;
    Label1: TLabel;
    Card2: TCard;
    Label2: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    DataSource1: TDataSource;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
    FController : iController;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  SimplePed.Controller;

{$R *.dfm}

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
  CardPanel1.ActiveCard := Card2;

  edtID.Text       := IntToStr(FController.Pedido.DAO._This.ID);
  dtpData.DateTime := FController.Pedido.DAO._This.DATA;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;

  FController := TSimplePedController.New(Self);
  FController.Pedido.DataSource(DataSource1).DAO.Find;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  FController.Pedido.DAO._This.DATA := dtpData.DateTime;
  FController.Pedido.DAO.Insert;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  CardPanel1.ActiveCard := Card1;
end;

end.
