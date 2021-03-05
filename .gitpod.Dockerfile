FROM gitpod/workspace-full-vnc

ENV ANDROID_HOME=/home/gitpod/android-sdk-linux \
    FLUTTER_HOME=/home/gitpod/flutter \
    PATH=/usr/lib/dart/bin:$FLUTTER_HOME/bin:$ANDROID_HOME/tools:$PATH

USER root

RUN curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && curl -fsSL https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list \
    && add-apt-repository ppa:git-core/ppa \
    && apt update; apt install -y git \
    && install-packages build-essential dart libkrb5-dev gcc make gradle android-tools-adb android-tools-fastboot

USER gitpod

RUN cd /home/gitpod \
    && wget -qO flutter_sdk.tar.xz https://storage.googleapis.com/flutter_infra/releases/beta/linux/flutter_linux_2.0.0-beta.tar.xz \
    && tar -xvf flutter_sdk.tar.xz && rm flutter_sdk.tar.xz \
    && wget -qO android_studio.tar.gz https://dl.google.com/dl/android/studio/ide-zips/4.1.2.0/android-studio-ide-201.7042882-linux.tar.gz \
    && tar -xvf android_studio.tar.gz && rm -f android_studio.tar.gz \
    && wget --output-document=android-sdk.zip --quiet https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip \
    && unzip android-sdk.zip && rm android-sdk.zip