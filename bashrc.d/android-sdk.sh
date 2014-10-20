ANDROID_SDK=$HOME/opt/android-sdk-linux
if [ -d $ANDROID_SDK ]; then
  export ANDROID_SDK
  export ANDROID_HOME=$ANDROID_SDK
  export PATH=$PATH:${ANDROID_SDK}/tools:${ANDROID_HOME}/platform-tools
fi
