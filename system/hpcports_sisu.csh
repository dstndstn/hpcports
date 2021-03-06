# This is a csh shell compatible resource file that is designed to initialize
# the HPCPorts modules environment.  You should source this file in your
# csh compatible shell resource file, at the very beginning of that file.

# What shell are we using?
set THISSHELL = `echo $SHELL | sed -r -e 's|.*/(.*)$|\1|'`

# Check to see if the modules init file has already been sourced
# If not then try to source the init file for this shell.  If that
# does not exist, source the basic "csh" file.

if ( ! $?MODULESHOME ) then
  if ( -r /opt/modules/default/init/$THISSHELL ) then
    source /opt/modules/default/init/$THISSHELL
  else
    source /opt/modules/default/init/csh
  endif
endif

alias hpcports 'module unuse /proj/planck/software/hpcports_shared_gnu/env/modulefiles ; module unuse /proj/planck/software/hpcports_gnu/env/modulefiles ; module unuse /proj/planck/software/planck_shared_gnu/modulefiles ; module unuse /proj/planck/software/planck_gnu/modulefiles eval "switch (\!:1) \\
  case "login": \\
  module use /proj/planck/software/hpcports_shared_gnu/env/modulefiles \\
  module use /proj/planck/software/planck_shared_gnu/modulefiles \\
  breaksw \\
  case "shared_gnu": \\
  module use /proj/planck/software/hpcports_shared_gnu/env/modulefiles \\
  module use /proj/planck/software/planck_shared_gnu/modulefiles \\
  breaksw \\
  case "gnu": \\
  module use /proj/planck/software/hpcports_gnu/env/modulefiles \\
  module use /proj/planck/software/planck_gnu/modulefiles
  breaksw \\
  default: \\
  echo "usage:  hpcports \[ gnu OR login \]" \\
  breaksw \\
endsw"'

