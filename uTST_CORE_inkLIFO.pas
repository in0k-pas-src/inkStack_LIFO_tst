unit uTST_CORE_inkLIFO;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses inkStack_node, uTST_CORE_inkStack;

const
 cTestSuitePath__inkLIFO='ink Stack LIFO';

type

  {[Type TeST Core Test Case] САМ РОДОначальник тестов}
 tTSTCTC_CORE_inkLIFO=class(tTSTCTC_CORE_inkStack)
  protected
    function  _stack_Create  (const Count:NativeInt; out last:pInkNodeStack):pInkNodeStack; override;
    procedure _stack_DESTROY (var   stck:pInkNodeStack);                                    override;
    function  _stack_clcCount(const stck:pInkNodeStack; out last:pInkNodeStack):NativeUint; override;
    function  _stack_getFirst(const stck:pInkNodeStack):pInkNodeStack;                      override;
    function  _stack_getNode (const stck:pInkNodeStack; index:NativeUint):pInkNodeStack;    override;
    function  _stack_getLast (const stck:pInkNodeStack):pInkNodeStack;                      override;
  end;

implementation

function tTSTCTC_CORE_inkLIFO._stack_Create(const Count:NativeInt; out last:pInkNodeStack):pInkNodeStack;
var i:NativeUint;
begin
    result:=nil;
    last  :=nil;
    if Count>0 then begin
        result:=_node_CRT(0,NIL);
        last  :=result;
        for i:=1 to count-1 do begin
           result:=_node_CRT(i,result);
        end;
    end;
end;

procedure tTSTCTC_CORE_inkLIFO._stack_DESTROY(var stck:pInkNodeStack);
var tmp:pInkNodeStack;
begin
    tmp:=stck;
    while tmp<>nil do begin
        stck:=stck^.next;
       _node_DST(tmp);
        tmp:=stck;
    end;
end;

function tTSTCTC_CORE_inkLIFO._stack_clcCount(const stck:pInkNodeStack; out last:pInkNodeStack):NativeUint;
begin
    last:=stck;
    result:=0;
    while last<>nil do begin
        inc(result);
        if last^.next=nil then break
        else last:=last^.next;
    end;
end;

function tTSTCTC_CORE_inkLIFO._stack_getFirst(const stck:pInkNodeStack):pInkNodeStack;
begin
    result:=stck;
end;

function tTSTCTC_CORE_inkLIFO._stack_getNode (const stck:pInkNodeStack; index:NativeUint):pInkNodeStack;
var i:NativeUint;
begin
    result:=stck;
    if (index>0)and(result<>nil) then begin;
        for i:=1 to index do begin
            result:=result^.next;
            if result=nil then break;
        end;
    end;
end;

function tTSTCTC_CORE_inkLIFO._stack_getLast(const stck:pInkNodeStack):pInkNodeStack;
begin
    result:=stck;
    while result<>nil do begin
        if result^.next=nil then break
        else result:=result^.next;
    end;
end;

end.
