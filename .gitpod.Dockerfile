FROM gitpod/workspace-full-vnc

ENV ANDROID_HOME=/home/gitpod/Android/Sdk \
    FLUTTER_HOME=/home/gitpod/flutter \
    PATH=$FLUTTER_HOME/bin:$ANDROID_HOME/tools:$PATH

USER root

RUN curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && add-apt-repository ppa:git-core/ppa \
    && apt update; apt install -y git \
    && install-packages build-essential libkrb5-dev gcc make gradle android-tools-adb android-tools-fastboot

USER gitpod

RUN cd /home/gitpod \
    && wget -qO flutter_sdk.tar.xz https://storage.googleapis.com/flutter_infra/releases/beta/linux/flutter_linux_2.0.0-beta.tar.xz \
    && tar -xvf flutter_sdk.tar.xz && rm flutter_sdk.tar.xz \
    && wget -qO android_studio.tar.gz https://dl.google.com/dl/android/studio/ide-zips/4.1.2.0/android-studio-ide-201.7042882-linux.tar.gz \
    && tar -xvf android_studio.tar.gz && rm -f android_studio.tar.gz \
    && wget -O skysend.bin https://github.com/redsolver/skysend/releases/download/v3.2/skysend-linux.bin
    && ./skysend.bin d https://skysend.hns.siasky.net/#b-CAC5pl0IkbI0l5GWI8eCjAm6e3toD6e9BpUH2s9z347AXA+eCQNBSt5g3UWLlyNiDz30MsalpC2KuzVz75jXl4eG8AQbL8nTOZSgVpp41XymkKz \
    && unzip Android.zip \
    && rm Android.zip \
    && mv Android /home/gitpod \
    && yes | sdk i java 8.0.282-open \
    && sdk i kotlin