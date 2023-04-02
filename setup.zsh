#!/usr/bin/env sh
#######################################################################
# @author      : AbdElHakim ZOUAI                                             #
# @email       : (abdelhakimzouai@gmail.com)                                          #
# @ID          : (002147483647@compte.dz)                            #
# @Project     : cutopia Script                                       #
# @Client      : ticenergy                                            #
# @License     : MIT                                          #
# @file        : setup                                             #
# @created     : السبت أفريل 01, 2023 04:52:43 CET                                        #
# @description :                                            #
#######################################################################
#!/usr/bin/env zsh





while getopts ":a:b:c:" opt; do
  case $opt in
    a)
      echo "Option -a with value $OPTARG"
      ;;
    b)
      echo "Option -b with value $OPTARG"
      ;;
    c)
      echo "Option -c with value $OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
    :)
      echo "Option -$OPTARG requires an argument" >&2
      ;;
  esac
done

