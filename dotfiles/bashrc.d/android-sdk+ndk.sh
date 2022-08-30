# Define $ANDROID_SDK and $ANDROID_NDK if null
[ -z "$ANDROID_SDK" ] && ANDROID_SDK=/opt/android/android-sdk-linux
[ -z "$ANDROID_NDK" ] && ANDROID_NDK=/opt/android/android-ndk

if [ -d $ANDROID_SDK ]; then
  export ANDROID_SDK
  export ANDROID_HOME=$ANDROID_SDK
  export PATH=$PATH:${ANDROID_SDK}/tools:${ANDROID_SDK}/platform-tools
fi

if [ -d $ANDROID_NDK ]; then
  export ANDROID_NDK
  export NDK_HOME=$ANDROID_NDK
#  export NDK_PATH=$ANDROID_NDK
  export PATH=$PATH:${ANDROID_NDK}
fi
