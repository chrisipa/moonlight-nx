FROM devkitpro/devkita64

# Set environment variables
ENV LIBCURL_PKGBUILD_URL=https://github.com/devkitPro/pacman-packages/raw/1582ad85914b14497fae32a9fe9074c0374f99f7/switch/curl/PKGBUILD
ENV LIBCURL_BUILD_USER=build

# Add non-privileged build user
RUN useradd -m -s /bin/bash -G sudo build; passwd -d build

# Install fakeroot and updated git
RUN echo "deb http://deb.debian.org/debian stretch-backports main" >> /etc/apt/sources.list.d/stretch-backports.list &&\
    apt-get update &&\
    apt-get -t stretch-backports -y install git fakeroot

# Install devkitpro-pkgbuild-helpers
RUN dkp-pacman -S --noconfirm devkitpro-pkgbuild-helpers

# Go to tmp folder
WORKDIR /tmp

# Compile and deploy custom libcurl if a PKGBUILD url is set
RUN curdir=$(pwd) && \
    mkdir -p switch-libcurl && \
    chown ${LIBCURL_BUILD_USER} switch-libcurl && \
    cd switch-libcurl && \
    wget ${LIBCURL_PKGBUILD_URL} && \
    sudo -u ${LIBCURL_BUILD_USER} dkp-makepkg && \
    cp -r pkg/switch-curl/opt/devkitpro/portlibs/switch/* /opt/devkitpro/portlibs/switch && \
    cd ${curdir} && \
    rm -rf switch-libcurl

# Set volume
VOLUME [ "/moonlight-nx" ]

# Set workdir
WORKDIR /moonlight-nx

# Run build.sh as entrypoint script
ENTRYPOINT ["/moonlight-nx/build.sh"]
