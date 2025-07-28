#!/bin/bash

# Script to copy module.modulemap to WebP.xcframework subdirectories

XCFRAMEWORK_PATH="WebP.xcframework"

# Define the module.modulemap content
MODULE_MAP_CONTENT='module WebP {
    header "WebP/encode.h"
    header "WebP/decode.h" 
    header "WebP/types.h"
    header "WebP/mux.h"
    header "WebP/mux_types.h"
    header "WebP/demux.h"
    export *
}'

# Find all Headers directories in WebP.xcframework
find "$XCFRAMEWORK_PATH" -name "Headers" -type d | while read -r headers_dir; do
    echo "Copying module.modulemap to: $headers_dir"
    echo "$MODULE_MAP_CONTENT" > "$headers_dir/module.modulemap"
done

echo "Done! module.modulemap copied to all WebP.xcframework architecture directories."