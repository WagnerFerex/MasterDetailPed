unit SimplePed.Model.Components.Factory;

interface

uses
  System.Classes,
  FireDAC.Comp.Client,
  SimplePed.Model.Components.Interfaces,
  SimpleInterface;

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
  FDBConnection: IModelComponentsConnection<TFDConnection>;

implementation

uses
  SimplePed.Model.Components.FireDAC,
  SimpleQueryFireDAC;

{ TModelComponentsFactory }

function TModelComponentsFactory.Conn: TComponent;
begin
  Result := FDBConnection.Conn;
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
  Result := TModelComponentsFDQuery.New(FDBConnection.Conn);
end;

function TModelComponentsFactory.SimpleQuery: iSimpleQuery;
begin
  Result := TSimpleQueryFiredac.New(FDBConnection.Conn);
end;

initialization
  FDBConnection := TModelComponentsFDConnection.New.Open('Database=..\..\DB\SimplePed.db;DriverID=SQLite');

end.
