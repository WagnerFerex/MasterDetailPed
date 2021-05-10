unit SimplePed.Model.Components.Interfaces;

interface

uses
  System.Classes,
  SimpleInterface;

type
  IModelComponentsQuery = interface
    ['{FFFBCAF4-3DC9-4195-A873-04D58D0FF4DE}']
    function Open: IModelComponentsQuery; overload;
    function Open(ASQL: string): IModelComponentsQuery; overload;
    function ExecSQL: IModelComponentsQuery;
    function SQLClear: IModelComponentsQuery;
    function SQL(AValue: string): IModelComponentsQuery;
    function AddParam(AParam: string; AValue: Variant): IModelComponentsQuery;
  end;


  IModelComponentsConnection<T: class> = interface
    ['{9FAA76D7-AA1A-4130-80E6-F445E2709F95}']
    function Conn: T;
    function Open(AParams: string): IModelComponentsConnection<T>;
  end;


  IModelComponentsFactory = interface
    ['{F936D81B-0F66-402E-A28D-099EB9968863}']
    function Query: IModelComponentsQuery;
    function SimpleQuery: iSimpleQuery;
  end;

implementation

end.
