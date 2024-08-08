#!/usr/bin/bash
set -euo pipefail
# A script to create new scripts
# Make multiple scripts in the future?

# takes user argument as name of script, defaults to new_script.sh if there's none
script_name=${1:-new_script}.sh
# create new script and make it executable
touch $script_name
chmod u+x $script_name

# add shebang and strict mode as header
echo "#!/usr/bin/bash" >> $script_name
echo "set -euo pipefail" >> $script_name


