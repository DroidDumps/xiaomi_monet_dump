set -x
# setup top mic
tinymix "ADC2_MIXER Switch" "1"
tinymix "ADC2 MUX" "INP2"
tinymix "HDR12 MUX" "NO_HDR12"

tinymix "TX SMIC MUX0" "ADC1"
tinymix 'TX DEC0 MUX' 'SWR_MIC'
tinymix 'IIR0 INP0 MUX' 'DEC0'
tinymix 'IIR0 INP0 Volume' 84
tinymix 'ADC4 Volume' 8

# setup rcv
tinymix 'RX INT0_1 MIX1 INP0' 'IIR0'

tinymix "RDAC3_MUX" "RX1"
tinymix "EAR_RDAC Switch" "1"

tinymix "RX_COMP1 Switch" "0"
tinymix "RX_COMP2 Switch" "0"
tinymix "RX INT0 DEM MUX" "CLSH_DSM_OUT"

tinymix "RX_EAR Mode" "ON"
tinymix "RX_RX0 Digital Volume" "84"
tinymix "EAR PA GAIN" "G_6_DB"
