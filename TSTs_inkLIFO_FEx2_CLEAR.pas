unit TSTs_inkLIFO_FEx2_CLEAR;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry, uTST_CORE_inkLIFO,
     inkLIFO;

type

 tTests_inkLIFO_FEx2_CLEAR=class(tTSTCTC_CORE_inkLIFO)
  published
    procedure Clear_NIL;
    procedure Clear_One;
    procedure Clear_Two;
    procedure Clear_Six;
  end;

implementation

procedure tTests_inkLIFO_FEx2_CLEAR.Clear_NIL;
begin
    STACK:=TST_stack_Create(0);
    //---
    inkLIFO_CLEAR(STACK,@TST_data_DESTROY);
    //---
    AssertNull(STACK);
end;

procedure tTests_inkLIFO_FEx2_CLEAR.Clear_One;
begin
    STACK:=TST_stack_Create(1);
    //---
    inkLIFO_CLEAR(STACK,@TST_data_DESTROY);
    //---
    AssertNull(STACK);
end;

procedure tTests_inkLIFO_FEx2_CLEAR.Clear_Two;
begin
    STACK:=TST_stack_Create(2);
    //---
    inkLIFO_CLEAR(STACK,@TST_data_DESTROY);
    //---
    AssertNull(STACK);
end;

procedure tTests_inkLIFO_FEx2_CLEAR.Clear_Six;
begin
    STACK:=TST_stack_Create(6);
    //---
    inkLIFO_CLEAR(STACK,@TST_data_DESTROY);
    //---
    AssertNull(STACK);
end;

initialization
    RegisterTest(cTestSuitePath__inkLIFO,tTests_inkLIFO_FEx2_CLEAR);
end.
