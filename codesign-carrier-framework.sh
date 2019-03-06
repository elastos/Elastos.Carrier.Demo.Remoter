#!/bin/sh

DESTNATION="${TARGET_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}/ElastosCarrier.framework/Frameworks"
CARRIERLIBS="crystal elacarrier elasession elafiletrans"

if [ -n "${EXPANDED_CODE_SIGN_IDENTITY}" -a "${CODE_SIGNING_REQUIRED}" != "NO" -a "${CODE_SIGNING_ALLOWED}" != "NO" ]; then
    for dylib in ${CARRIERLIBS}; do
    /usr/bin/codesign --force --sign ${EXPANDED_CODE_SIGN_IDENTITY} ${OTHER_CODE_SIGN_FLAGS}  --preserve-metadata=identifier,entitlements "${DESTNATION}/lib${dylib}.dylib"
    done
fi
