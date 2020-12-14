set -x
# $1: device for output
#     spk: speaker
#     rcv: receiver
#     spk_hp: speaker high power
#     us: ultrasound

# tinyplay file.wav [-D card] [-d device] [-p period_size] [-n n_periods]
# sample usage: playback.sh spk
# rcv.wav:-4.5dbfs   spk: -4.8dbfs  ultra: -4.5dbfs  spk_hp:-1.8dbfs

function enable_receiver
{
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
}

function disable_receiver
{
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
}

function enable_speaker
{
    echo "enabling speaker"
    tinymix "SEC_MI2S_RX Audio Mixer MultiMedia1" "1"
    tinymix "SEC_MI2S_RX Channels" "One"
    tinymix "PCM Source" "ASP"
    tinymix "AMP PCM Gain" "17"
    tinymix "ASP TX1 Source" "DSPTX1"
    tinymix "ASP TX2 Source" "DSPTX1"

    sleep 1
}

function disable_speaker
{
	echo "disabling speaker"
	tinymix "SEC_MI2S_RX Audio Mixer MultiMedia1" "0"
	tinymix "ASP TX1 Source" "Zero"
	tinymix "ASP TX2 Source" "Zero"

	echo "disabling speaker"
	tinymix 'PCM Source' 'DSP'
	tinymix 'AMP PCM Gain' 14
	tinymix 'SEC_MI2S_RX Audio Mixer MultiMedia1' 0
	tinymix 'SEC_MI2S_RX Channels' 'Two'
}

function enable_ultrasound
{
	echo "enabling ultrasound"

	tinymix "RX_MACRO RX2 MUX" "AIF2_PB"
	tinymix "RX INT0_2 MUX" "RX2"

	tinymix "RDAC3_MUX" "RX1"
	tinymix "EAR_RDAC Switch" "1"

	tinymix "RX_EAR Mode" "ON"
	tinymix "RX_COMP1 Switch" "0"
	tinymix "RX_COMP2 Switch" "0"
	tinymix "RX INT0 DEM MUX" "CLSH_DSM_OUT"

	tinymix "RX_RX0 Digital Volume" "84"
	tinymix "EAR PA GAIN" "G_6_DB"
	tinymix "RX_CDC_DMA_RX_1 SampleRate" "KHZ_96"
	tinymix "RX_CDC_DMA_RX_1 Channels" "One"
	tinymix "RX_CDC_DMA_RX_1 Audio Mixer MultiMedia1" "1"
}

function disable_ultrasound
{
	echo "disable ultrasound"

	tinymix "RDAC3_MUX" "RX1"
	tinymix "EAR_RDAC Switch" "0"

	tinymix "RX_MACRO RX2 MUX" "ZERO"
	tinymix "RX INT0_2 MIX1 INP0" "ZERO"

	tinymix "RX_EAR Mode" "OFF"
	tinymix "RX_COMP1 Switch" "0"
	tinymix "RX_COMP2 Switch" "0"
	tinymix "RX INT0 DEM MUX" "ZERO"

	tinymix "RX_RX0 Digital Volume" "84"
	tinymix "RX_CDC_DMA_RX_1 SampleRate" "KHZ_48"
	tinymix "RX_CDC_DMA_RX_1 Channels" "One"
	tinymix "RX_CDC_DMA_RX_1 Audio Mixer MultiMedia1" "0"
}

if [ "$1" = "spk" ]; then
	enable_speaker
	filename=/vendor/etc/spk.wav
elif [ "$1" = "rcv" ]; then
	enable_receiver
	filename=/vendor/etc/rcv.wav
elif [ "$1" = "spk_hp" ]; then
	enable_speaker
	filename=/vendor/etc/spk_hp.wav
elif [ "$1" = "us" ]; then
	enable_ultrasound
	filename=/vendor/etc/ultrasound.wav
else
	echo "Usage: playback.sh device; device: spk or rcv or spk_hp or us"
fi

echo "start playing"
tinyplay $filename

if [ "$1" = "spk" ]; then
	disable_speaker
elif [ "$1" = "rcv" ]; then
	disable_receiver
elif [ "$1" = "spk_hp" ]; then
	disable_speaker
elif [ "$1" = "us" ]; then
	disable_ultrasound
fi

exit 0
