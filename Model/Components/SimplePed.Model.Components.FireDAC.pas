unit SimplePed.Model.Components.FireDAC;

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
  FireDAC.Stan.Param,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Comp.UI,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  SimplePed.Model.Components.Interfaces;

type
  TModelComponentsFDConnection = class(TInterfacedObject, IModelComponentsConnection<TFDConnection>)
  private
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelComponentsConnection<TFDConnection>;
    function Conn: TFDConnection;
    function Open(AParams: string): IModelComponentsConnection<TFDConnection>;
  end;

  TModelComponentsFDQuery = class(TInterfacedObject, IModelComponentsQuery)
  private
    FDQuery1: TFDQuery;
    FDConnection1: iModelComponentsConnection<TFDConnection>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelComponentsQuery;
    function Open: IModelComponentsQuery; overload;
    function Open(ASQL: string): IModelComponentsQuery; overload;
    function ExecSQL: IModelComponentsQuery;
    function SQLClear: IModelComponentsQuery;
    function SQL(AValue: string): IModelComponentsQuery;
    function AddParam(AParam: string; AValue: Variant): IModelComponentsQuery;
  end;

implementation

{ TModelComponentsFireDAC }

function TModelComponentsFDQuery.AddParam(AParam: string; AValue: Variant): IModelComponentsQuery;
begin
  Result := Self;
  FDQuery1.ParamByName(AParam).Value := AValue;
end;

constructor TModelComponentsFDQuery.Create(AConnection: TComponent);
begin
  FDConnection1 := (AConnection as TFDConnection);
  FDQuery1 := TFDQuery.Create(nil);
  FDQuery1.Connection := FDConnection1;
end;

destructor TModelComponentsFDQuery.Destroy;
begin
  FDQuery1.DisposeOf;
  inherited;
end;

function TModelComponentsFDQuery.ExecSQL: IModelComponentsQuery;
begin
  Result := Self;
  FDQuery1.ExecSQL;
end;

class function TModelComponentsFDQuery.New(AConnection: TComponent): IModelComponentsQuery;
begin
  Result := Self.Create(AConnection);
end;

function TModelComponentsFDQuery.Open: IModelComponentsQuery;
begin
  Result := Self;
  FDQuery1.Open;
end;

function TModelComponentsFDQuery.Open(ASQL: string): IModelComponentsQuery;
begin
  Result := Self;
  FDQuery1.Open(ASQL);
end;

function TModelComponentsFDQuery.SQL(AValue: string): IModelComponentsQuery;
begin
  Result := Self;
  FDQuery1.SQL.Add(AValue);
end;

function TModelComponentsFDQuery.SQLClear: IModelComponentsQuery;
begin
  Result := Self;
  FDQuery1.SQL.Clear;
end;

{ TModelComponentsFDConnection }

function TModelComponentsFDConnection.Conn: TComponent;
begin
  Result := FDConnection1;
end;

constructor TModelComponentsFDConnection.Create;
begin
  FDConnection1 := TFDConnection.Create(nil);
  FDConnection1.LoginPrompt := False;

end;

destructor TModelComponentsFDConnection.Destroy;
begin
  FDConnection1.DisposeOf;
  inherited;
end;

class function TModelComponentsFDConnection.New: IModelComponentsConnection;
begin
  Result := Self.Create;
end;

function TModelComponentsFDConnection.Open(AParams: string): IModelComponentsConnection;
begin
  Result := Self;
  FDConnection1.Open(AParams);   // *** 'Database=..\..\DB\SimplePed.db;DriverID=SQLite' ***
end;

end.
