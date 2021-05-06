unit SimplePed.Model.DAO.SQL;

interface

uses
  Data.DB,
  System.Generics.Collections,
  SimpleInterface,
  SimpleDAO,
  SimpleUtil,
  SimpleQueryFireDAC,
  SimplePed.Model.DAO.Interfaces,
  SimplePed.Model.Conexao.FireDAC;

type
  TModelDAO<T: class, constructor> = class(TInterfacedObject, iModelDAO<T>)
  private
    FThis : T;
    FNewThis : T;
    FList : TObjectList<T>;
    FSimpleDAO : iSimpleDAO<T>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelDAO<T>;
    function DataSource(ADataSource: TDataSource): iModelDAO<T>;
    function _This: T;
    function _NewThis: T;
    function SQL : iSimpleDAOSQLAttribute<T>;
    function Find: TObjectList<T>; overload;
    function Find(Aid: Variant): T; overload;
    function Find(Where: string; OrderBy: string = ''): TObjectList<T>; overload;
    function Insert: iModelDAO<T>; overload;
    function Update: iModelDAO<T>; overload;
    function Delete: iModelDAO<T>; overload;
    function Insert(aObject: T): iModelDAO<T>; overload;
    function Update(aObject: T): iModelDAO<T>; overload;
    function Delete(aObject: T): iModelDAO<T>; overload;
  end;

implementation

{ TModelDAO<T> }

constructor TModelDAO<T>.Create;
begin
  FNewThis := T.Create;
  FSimpleDAO := TSimpleDAO<T>.New(TSimpleQueryFiredac.New(TDMFireDAC.GetInstance));
end;

function TModelDAO<T>.DataSource(ADataSource: TDataSource): iModelDAO<T>;
begin
  Result := Self;
  FSimpleDAO.DataSource(ADataSource);
end;

function TModelDAO<T>.Delete: iModelDAO<T>;
begin
  Result := Self;
  FSimpleDAO.Delete(FThis);
end;

function TModelDAO<T>.Delete(aObject: T): iModelDAO<T>;
begin
  Result := Self;
  FSimpleDAO.Delete(aObject);
end;

destructor TModelDAO<T>.Destroy;
begin
  if Assigned(FThis) then
    FThis.Free;

  if Assigned(FNewThis) then
    FNewThis.Free;

  inherited;
end;

function TModelDAO<T>.Find(Aid: Variant): T;
begin
  FThis := FSimpleDAO.Find(Integer(AId));
  Result := FThis;
end;

function TModelDAO<T>.Find: TObjectList<T>;
begin
  FList := TObjectList<T>.Create;
  FSimpleDAO.Find(FList);
  Result := FList;
end;

function TModelDAO<T>.Find(Where, OrderBy: string): TObjectList<T>;
begin
  FSimpleDAO.SQL.Where(Where).OrderBy(OrderBy);
  FSimpleDAO.Find(FList);
  Result := FList;
end;

function TModelDAO<T>.Insert(aObject: T): iModelDAO<T>;
begin
  Result := Self;
  FSimpleDAO.Insert(aObject);
end;

function TModelDAO<T>.Insert: iModelDAO<T>;
begin
  Result := Self;
  FSimpleDAO.Insert(FNewThis);

  if Assigned(FNewThis) then
    FNewThis.Free;

  FNewThis := T.Create;
end;

class function TModelDAO<T>.New: iModelDAO<T>;
begin
  Result := Self.Create;
end;

function TModelDAO<T>.SQL: iSimpleDAOSQLAttribute<T>;
begin
  Result := FSimpleDAO.SQL;
end;

function TModelDAO<T>.Update(aObject: T): iModelDAO<T>;
begin
  Result := Self;
  FSimpleDAO.Update(aObject);
end;

function TModelDAO<T>.Update: iModelDAO<T>;
begin
  Result := Self;
  FSimpleDAO.Update(FThis);
end;

function TModelDAO<T>._NewThis: T;
begin
  Result := FNewThis;
end;

function TModelDAO<T>._This: T;
begin
  Result := FThis;
end;

end.
