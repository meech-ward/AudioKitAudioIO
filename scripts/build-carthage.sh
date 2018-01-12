AUDIO_KIT_GITHUB="https://github.com/AudioKit/AudioKit.git"
AUDIO_KIT_BRANCH="develop"

AUDIO_IO_DIR="$(pwd)/../../../Entities/AudioIO"

echo "" > ../Cartfile
echo "git \"$AUDIO_IO_DIR\"" >> ../Cartfile
echo "git \"$AUDIO_KIT_GITHUB\" \"$AUDIO_KIT_BRANCH\"" >> ../Cartfile

cd ../
carthage update --platform iOS

# Just for the swift package entities
cd Carthage/Checkouts/AudioIO
swift package generate-xcodeproj

carthage build --platform iOS

cd ../../../
carthage update --platform iOS