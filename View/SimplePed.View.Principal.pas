unit SimplePed.View.Principal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.DBCtrls,
  SimplePed.Controller.Interfaces;

type
  TForm6 = class(TForm)
    edtID: TEdit;
    edtDESCRICAO: TEdit;
    edtVALORUNITARIO: TEdit;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DataSource1: TDataSource;
    DBGrid2: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    Edit1: TEdit;
    Button5: TButton;
    DBGrid3: TDBGrid;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    FController : iController;
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses
  SimplePed.Controller;

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
begin
  FController.Produto.Buscar;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
  FController.Produto._This.DESCRICAO := edtDESCRICAO.Text;
  FController.Produto._This.VALORUNITARIO := StrToCurr(edtVALORUNITARIO.Text);
  FController.Produto.Insert.Buscar;
end;

procedure TForm6.Button3Click(Sender: TObject);
begin
  FController.Produto._This.ID := StrToInt(edtID.Text);
  FController.Produto._This.DESCRICAO := edtDESCRICAO.Text;
  FController.Produto._This.VALORUNITARIO := StrToCurr(edtVALORUNITARIO.Text);
  FController.Produto.Update.Buscar;
end;

procedure TForm6.Button4Click(Sender: TObject);
begin
  FController.Produto._This.ID := StrToInt(edtID.Text);
  FController.Produto.Delete.Buscar;
end;

procedure TForm6.Button5Click(Sender: TObject);
begin
  with FController.Pedido.Itens.DAO._This do
  begin
    ID_PEDIDO  := DataSource2.DataSet.FieldByName('ID_PEDIDO').AsInteger;
    ID_PRODUTO := DataSource1.DataSet.FieldByName('ID_PRODUTO').AsInteger;
    VALORUNITARIO := DataSource1.DataSet.FieldByName('VALORUNITARIO').AsCurrency;
    QUANTIDADE := StrToCurr(Edit1.Text);
    VALORTOTAL := (VALORUNITARIO * QUANTIDADE);
  end;

  FController
    .Pedido
    .Itens
      .DAO
        .Insert
        .Find(DataSource2.DataSet.FieldByName('ID_PEDIDO').AsInteger);
end;

procedure TForm6.Button6Click(Sender: TObject);
begin
  FController.Pedido.DAO.Find;
end;

procedure TForm6.Button7Click(Sender: TObject);
begin
  FController.Pedido.DAO._This.DATA := Now;
  FController.Pedido.DAO.Insert.Find;
end;

procedure TForm6.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  edtID.Text := DataSource1.DataSet.FieldByName('ID_PRODUTO').AsString;
  edtDESCRICAO.Text := DataSource1.DataSet.FieldByName('DESCRICAO').AsString;
  edtVALORUNITARIO.Text := DataSource1.DataSet.FieldByName('VALORUNITARIO').AsString;
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  FController := TSimplePedController.New(Self);
  FController.Produto.DataSource(DataSource1);
  FController.Pedido.DataSource(DataSource2);
  FController.Pedido.Itens.DataSource(DataSource3);
end;

end.
