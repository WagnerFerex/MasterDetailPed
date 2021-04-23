unit SimplePed.Model.Conexao.FireDAC;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  FireDAC.VCLUI.Wait,
  FireDAC.UI.Intf,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Phys.SQLite,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Comp.UI,
  FireDAC.Comp.Client;


type
  TDMFireDAC = class(TDataModule)
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
  private
  public
    class function GetInstance: TFDConnection;
  end;

var
  DMFireDAC: TDMFireDAC;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TModelConexao }

class function TDMFireDAC.GetInstance: TFDConnection;
begin
  Result := DMFireDAC.FDConnection1;
end;

end.
