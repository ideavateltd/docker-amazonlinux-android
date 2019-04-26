FROM ideavate/amazonlinux:2

RUN yum -y upgrade \
 && yum -y install java-1.8.0-openjdk-devel unzip
ENV JAVA_HOME="/usr/lib/jvm/java-1.8.0"

# CLI tools 26 from https://developer.android.com/studio/#downloads
ENV SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip" \
    ANDROID_HOME="/usr/local/android-sdk"

# Download Android SDK
RUN mkdir "$ANDROID_HOME" .android \
 && cd "$ANDROID_HOME" \
 && curl -o sdk.zip $SDK_URL \
 && unzip sdk.zip \
 && rm sdk.zip \
 && yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses

RUN chmod -R a=rwx ${ANDROID_HOME}

RUN mkdir /application
WORKDIR /application