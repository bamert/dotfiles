TEMP=$("/Applications/smcFanControl.app/Contents/Resources/smc" -k TC0C -r | awk '{print $3}')
TEMP_INTEGER=${TEMP%%.*}
echo $TEMP_INTEGER
