unit TSTs_inkLIFO_20x4_Enumerate;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry,
    uTST_CORE_inkLIFO,
     inkLIFO;

type

 tTests_inkLIFO_20x4_Enumerate= class(tTSTCTC_CORE_inkLIFO)
  protected
    procedure _enumData_CLR(const DATA:pointer; str:NativeInt);
  protected
    function _Enum_FNK_(const Data:pointer; const NODE:pointer):boolean;
  published
    procedure Enumerate_Nil;
    procedure Enumerate_One;
    procedure Enumerate_Two;
    procedure Enumerate_SiX;
  end;

implementation

type
 rTests_EnumDATA=record
    owner  :tTSTCTC_CORE_inkLIFO;
    counter:NativeInt;
    order  :NativeInt;
  end;
 pTests_EnumDATA=^rTests_EnumDATA;

function tTests_inkLIFO_20x4_Enumerate._Enum_FNK_(const Data:pointer; const NODE:pointer):boolean;
begin
    result:=true;
    //---
    with pTests_EnumDATA(DATA)^ do begin
      counter:=counter+1;
      order  :=order-1;
      owner.AssertEquals('wrong enumerate Sequence', order,owner.TST_node_Nmbr(NODE));
    end;
end;

//------------------------------------------------------------------------------

procedure tTests_inkLIFO_20x4_Enumerate._enumData_CLR(const DATA:pointer; str:NativeInt);
begin
    with pTests_EnumDATA(DATA)^ do begin
      owner  :=SELF;
      counter:=0;
      order  :=str;
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure tTests_inkLIFO_20x4_Enumerate.Enumerate_Nil;
var lst:pointer;
    ddd:rTests_EnumDATA;
begin
    STACK:=TST_stack_Create(0);
   _enumData_CLR(@ddd,TST_STACK_Count);
    //--
    lst:=inkLIFO_nodesEnum(STACK,@ddd,@_Enum_FNK_);
    //--
    AssertNull  ('wrong enum stop' , lst);
    AssertEquals('wrong enum count', TST_STACK_Count, DDD.counter);
end;

procedure tTests_inkLIFO_20x4_Enumerate.Enumerate_One;
var lst:pointer;
    ddd:rTests_EnumDATA;
begin
    STACK:=TST_stack_Create(1);
   _enumData_CLR(@ddd,TST_STACK_Count);
    //--
    lst:=inkLIFO_nodesEnum(STACK,@ddd,@_Enum_FNK_);
    //--
    AssertNull  ('wrong enum stop' , lst);
    AssertEquals('wrong enum count', TST_STACK_Count, DDD.counter);
end;

procedure tTests_inkLIFO_20x4_Enumerate.Enumerate_Two;
var lst:pointer;
    ddd:rTests_EnumDATA;
begin
    STACK:=TST_stack_Create(2);
   _enumData_CLR(@ddd,TST_STACK_Count);
    //--
    lst:=inkLIFO_nodesEnum(STACK,@ddd,@_Enum_FNK_);
    //--
    AssertNull  ('wrong enum stop' , lst);
    AssertEquals('wrong enum count', TST_STACK_Count, DDD.counter);
end;

procedure tTests_inkLIFO_20x4_Enumerate.Enumerate_SiX;
var lst:pointer;
    ddd:rTests_EnumDATA;
begin
    STACK:=TST_stack_Create(6);
   _enumData_CLR(@ddd,TST_STACK_Count);
    //--
    lst:=inkLIFO_nodesEnum(STACK,@ddd,@_Enum_FNK_);
    //--
    AssertNull  ('wrong enum stop' , lst);
    AssertEquals('wrong enum count', TST_STACK_Count, DDD.counter);
end;

initialization
    RegisterTest(cTestSuitePath__inkLIFO,tTests_inkLIFO_20x4_Enumerate);
end.

