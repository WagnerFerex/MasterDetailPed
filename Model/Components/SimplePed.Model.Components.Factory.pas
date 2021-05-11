unit SimplePed.Model.Components.Factory;

interface

uses
  System.Classes,
  FireDAC.Comp.Client,
  SimplePed.Model.Components.Interfaces,
  SimpleInterface,
  SimpleQueryFireDAC;

type
  TModelComponentsFactory = class(TInterfacedObject, IModelComponentsFactory)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelComponentsFactory;
    function Conn: TComponent;
    function Query: IModelComponentsQuery;
    function SimpleQuery: iSimpleQuery;
  end;

var
  FModelConnection: IModelComponentsConnection<TFDConnection>;

implementation

uses
  SimplePed.Model.Components.FireDAC;

{ TModelComponentsFactory }

function TModelComponentsFactory.Conn: TComponent;
begin
  Result := FModelConnection.Conn;
end;

constructor TModelComponentsFactory.Create;
begin

end;

destructor TModelComponentsFactory.Destroy;
begin

  inherited;
end;

class function TModelComponentsFactory.New: IModelComponentsFactory;
begin
  Result := Self.Create
end;

function TModelComponentsFactory.Query: IModelComponentsQuery;
begin
  Result := TModelComponentsFDQuery.New(FModelConnection.Conn);
end;

function TModelComponentsFactory.SimpleQuery: iSimpleQuery;
begin
  Result := TSimpleQueryFiredac.New(FModelConnection.Conn);
end;

initialization
  FModelConnection := TModelComponentsFDConnection.New.Open('Database=..\..\DB\SimplePed.db;DriverID=SQLite');

end.
