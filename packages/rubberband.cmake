ExternalProject_Add(rubberband
    GIT_REPOSITORY https://github.com/breakfastquay/rubberband.git
    SOURCE_DIR ${SOURCE_LOCATION}
    # GIT_SHALLOW 1
    # GIT_REMOTE_NAME origin
    GIT_TAG e90f377600d6097c6e37d0824f98bf60f77a0841
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${EXEC} meson <BINARY_DIR> <SOURCE_DIR>
        --prefix=${MINGW_INSTALL_PREFIX}
        --libdir=${MINGW_INSTALL_PREFIX}/lib
        --cross-file=${MESON_CROSS}
        --buildtype=release
        --default-library=static
        -Dfft=builtin
        -Dresampler=builtin
    BUILD_COMMAND ${EXEC} ninja -C <BINARY_DIR>
    INSTALL_COMMAND ${EXEC} ninja -C <BINARY_DIR> install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(rubberband)
force_meson_configure(rubberband)
cleanup(rubberband install)
