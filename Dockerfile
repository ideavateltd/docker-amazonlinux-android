FROM ideavate/amazonlinux-android:nosdk

ENV ANDROID_VERSION=28 \
    ANDROID_BUILD_TOOLS_VERSION=28.0.3

# Install Android Build Tool and Libraries
RUN $ANDROID_HOME/tools/bin/sdkmanager --update
RUN $ANDROID_HOME/tools/bin/sdkmanager "build-tools;${ANDROID_BUILD_TOOLS_VERSION}" \
    "platforms;android-${ANDROID_VERSION}" \
    "platform-tools"

RUN chmod a=rwx $ANDROID_HOME
