set height 0
#set disassembly-flavor intel
#set detach-on-fork off
#set follow-exec-mode new
#set follow-fork-mode child
set print pretty on
# set print array on
# set print address off
set print vtbl on
set print object on
set print static-members off
#set disable-randomization off
#set disassemble-next-line on
#set non-stop on
#set environment LD_PRELOAD ~/mylib.so
set confirm off

define l1
  if  $argc == 1
    set logging file $arg0
  end
  set logging on
end

document l1
Start logging output.
end

define l2
  set logging off
end

document l2
Stop logging output.
end
