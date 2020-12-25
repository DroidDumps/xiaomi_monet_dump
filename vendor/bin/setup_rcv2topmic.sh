# tinyplay file.wav [-D card] [-d device] [-p period_size] [-n n_periods]
# sample usage: playback.sh 2000.wav  1
set -x

sleep 1

echo "enabling top mic"
tinymix 'TX DEC1 MUX' 'SWR_MIC'
tinymix 'TX SMIC MUX1' 'ADC3'
tinymix 'ADC4_MIXER Switch' 1
tinymix 'TX_AIF1_CAP Mixer DEC1' 1
tinymix 'ADC4 MUX' 'INP5'
tinymix 'ADC4 Volume' 6
tinymix 'IIR0 INP0 MUX' 'DEC0'
tinymix 'IIR0 INP0 Volume' 84
tinymix 'TX_CDC_DMA_TX_3 Channels' 'One'

tinymix 'MultiMedia1 Mixer TX_CDC_DMA_TX_3' 1
tinymix 'TX_CDC_DMA_TX_3 SampleRate' $rate

# start recording
nohup tinycap /sdcard/top_mic.wav -r 48000 -b 16 -T 6 > /sdcard/nohup.out &



sleep 2
echo "enabling receiver"
	tinymix "RX_MACRO RX0 MUX" "AIF1_PB"
	tinymix "RX INT0_1 MIX1 INP0" "RX0"

	tinymix "RDAC3_MUX" "RX1"
	tinymix "EAR_RDAC Switch" "1"

	tinymix "RX_EAR Mode" "ON"
	tinymix "RX_COMP1 Switch" "0"
	tinymix "RX_COMP2 Switch" "0"
	tinymix "RX INT0 DEM MUX" "CLSH_DSM_OUT"

	tinymix "RX_RX0 Digital Volume" "84"
	tinymix "EAR PA GAIN" "G_6_DB"
	tinymix "RX_CDC_DMA_RX_0 Channels" "One"
	tinymix "RX_CDC_DMA_RX_0 Audio Mixer MultiMedia1" "1"

    tinyplay /vendor/etc/rcv_pink.wav

sleep 1


echo "disabling top mic"
tinymix 'TX SMIC MUX1' 'ZERO'
tinymix 'TX_CDC_DMA_TX_3 Channels' 'One'
tinymix 'TX_AIF1_CAP Mixer DEC1' 0
tinymix 'ADC4_MIXER Switch' 0

tinymix 'MultiMedia1 Mixer TX_CDC_DMA_TX_3' 0
tinymix 'TX_CDC_DMA_TX_3 SampleRate' 'KHZ_48'


echo "disabling receiver"
	tinymix "RDAC3_MUX" "RX1"
	tinymix "EAR_RDAC Switch" "0"

	tinymix "RX_MACRO RX0 MUX" "ZERO"
	tinymix "RX INT0_1 MIX1 INP0" "ZERO"

	tinymix "RX_EAR Mode" "OFF"
	tinymix "RX_COMP1 Switch" "0"
	tinymix "RX_COMP2 Switch" "0"
	tinymix "RX INT0 DEM MUX" "ZERO"

	tinymix "RX_RX0 Digital Volume" "84"
	tinymix "RX_CDC_DMA_RX_0 Channels" "One"
	tinymix "RX_CDC_DMA_RX_0 Audio Mixer MultiMedia1" "0"

