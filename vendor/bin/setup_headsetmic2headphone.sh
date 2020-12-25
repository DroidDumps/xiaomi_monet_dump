set -x
# setup headsetmic
tinymix "ADC2_MIXER Switch" "1"
tinymix "ADC2 MUX" "INP2"
tinymix "HDR12 MUX" "NO_HDR12"

tinymix "TX SMIC MUX0" "ADC1"
tinymix 'TX DEC0 MUX' 'SWR_MIC'
tinymix 'IIR0 INP0 MUX' 'DEC0'
tinymix 'IIR0 INP0 Volume' 84
tinymix 'ADC4 Volume' 12

# setup headphone
tinymix 'RX INT0_1 MIX1 INP0' 'IIR0'
tinymix 'RX INT1_1 MIX1 INP0' 'IIR0'
tinymix 'RX INT0 DEM MUX' 'CLSH_DSM_OUT'
tinymix 'RX INT1 DEM MUX' 'CLSH_DSM_OUT'
tinymix 'HPHL_RDAC Switch' 1
tinymix 'HPHR_RDAC Switch' 1
tinymix 'HPHL Volume' 20
tinymix 'HPHR Volume' 20
