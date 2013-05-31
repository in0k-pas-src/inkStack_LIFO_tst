unit TSTs_inkLIFO_11_Count;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry, uTST_CORE_inkLIFO,
     inkLIFO;

type

 tTests_inkLIFO_11_Count=class(tTSTCTC_CORE_inkLIFO)
  published
    procedure Count_NIL;
    procedure Count_One;
    procedure Count_Two;
    procedure Count_Six;
  end;

implementation

procedure tTests_inkLIFO_11_Count.Count_NIL;
begin
    STACK:=TST_stack_Create(0);
    //---
    AssertEquals(TST_STACK_Count, inkLIFO_Count(STACK));
end;

procedure tTests_inkLIFO_11_Count.Count_One;
begin
    STACK:=TST_stack_Create(1);
    //---
    AssertEquals(TST_STACK_Count, inkLIFO_Count(STACK));
end;

procedure tTests_inkLIFO_11_Count.Count_Two;
begin
    STACK:=TST_stack_Create(2);
    //---
    AssertEquals(TST_STACK_Count, inkLIFO_Count(STACK));
end;

procedure tTests_inkLIFO_11_Count.Count_Six;
begin
    STACK:=TST_stack_Create(6);
    //---
    AssertEquals(TST_STACK_Count, inkLIFO_Count(STACK));
end;

initialization
    RegisterTest(cTestSuitePath__inkLIFO,tTests_inkLIFO_11_Count);
end.
