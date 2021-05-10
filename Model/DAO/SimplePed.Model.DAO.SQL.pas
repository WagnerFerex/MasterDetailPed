unit SimplePed.Model.DAO.SQL;

interface

uses
  Data.DB,
  System.Generics.Collections,
  SimpleInterface,
  SimpleDAO,
  SimpleUtil,
  SimpleQueryFireDAC,
  SimplePed.Model.DAO.Interfaces;

type
  TModelDAO<T: class, constructor> = class(TInterfacedObject, iModelDAO<T>)
  private
    FThis : T;
    FQueryFireDAC: iSimpleQuery;
    FSimpleDAO : iSimpleDAO<T>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelDAO<T>;
    function DataSet: TDataSet;
    function _This: T;
    function SQL : iSimpleDAOSQLAttribute<T>;
    function Find(AList: TObjectList<T>) : iModelDAO<T>; overload;
    function Find(Aid: Variant): T; overload;
    function Find(Where: string = ''; OrderBy: string = ''): TObjectList<T>; overload;
    function Insert: iModelDAO<T>; overload;
    function Update: iModelDAO<T>; overload;
    function Delete: iModelDAO<T>; overload;
    function Insert(aObject: T): iModelDAO<T>; overload;
    function Update(aObject: T): iModelDAO<T>; overload;
    function Delete(aObject: T): iModelDAO<T>; overload;
  end;

implementation

{ TModelDAO<T> }

uses
  SimplePed.Model.Components.Factory;

constructor TModelDAO<T>.Create;
begin
  FThis := T.Create;
  FQueryFireDAC := TModelComponentsFactory.New.SimpleQuery;
  FSimpleDAO := TSimpleDAO<T>.New(FQueryFireDAC);
end;

function TModelDAO<T>.DataSet: TDataSet;
begin
  Result := FQueryFireDAC.DataSet;
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
  FThis.DisposeOf;
  inherited;
end;

function TModelDAO<T>.Find(Aid: Variant): T;
begin
  Result := FSimpleDAO.Find(Integer(AId));
end;

function TModelDAO<T>.Find(AList: TObjectList<T>): iModelDAO<T>;
begin
  Result := Self;
  FSimpleDAO.Find(AList);
end;

function TModelDAO<T>.Find(Where, OrderBy: string): TObjectList<T>;
begin
  FSimpleDAO
    .SQL
      .Where(Where)
      .OrderBy(OrderBy)
    .&End
    .Find;
end;

function TModelDAO<T>.Insert(aObject: T): iModelDAO<T>;
begin
  Result := Self;
  FSimpleDAO.Insert(aObject);
end;

function TModelDAO<T>.Insert: iModelDAO<T>;
begin
  Result := Self;
  FSimpleDAO.Insert(FThis);
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

function TModelDAO<T>._This: T;
begin
  Result := FThis;
end;

end.
