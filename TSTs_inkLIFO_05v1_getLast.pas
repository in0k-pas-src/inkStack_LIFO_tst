unit TSTs_inkLIFO_05v1_getLast;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry,
    uTST_CORE_inkLIFO,
     inkLIFO;

type

 tTests_inkLIFO_05v1_nodeGetLast= class(tTSTCTC_CORE_inkLIFO)
  published
    procedure getLast_Nil;
    procedure getLast_One;
    procedure getLast_Two;
    procedure getLast_SiX;
  end;

implementation

procedure  tTests_inkLIFO_05v1_nodeGetLast.getLast_Nil;
var lst:pointer;
begin
    STACK:=TST_stack_Create(0,lst);
    AssertSame('wrong last Node', lst,inkLIFO_nodeGetLast(STACK));
end;

procedure  tTests_inkLIFO_05v1_nodeGetLast.getLast_One;
var lst:pointer;
begin
    STACK:=TST_stack_Create(1,lst);
    AssertSame('wrong last Node', lst,inkLIFO_nodeGetLast(STACK));
end;

procedure  tTests_inkLIFO_05v1_nodeGetLast.getLast_Two;
var lst:pointer;
begin
    STACK:=TST_stack_Create(2,lst);
    AssertSame('wrong last Node', lst,inkLIFO_nodeGetLast(STACK));
end;

procedure  tTests_inkLIFO_05v1_nodeGetLast.getLast_SiX;
var lst:pointer;
begin
    STACK:=TST_stack_Create(6,lst);
    AssertSame('wrong last Node', lst,inkLIFO_nodeGetLast(STACK));
end;

initialization
    RegisterTest(cTestSuitePath__inkLIFO,tTests_inkLIFO_05v1_nodeGetLast);
end.

