if [[ ":$MOZ_GMP_PATH:" != *":/usr/lib64/mozilla/plugins/gmp-gmpopenh264/system-installed:"* ]]; then
    MOZ_GMP_PATH="${MOZ_GMP_PATH}${MOZ_GMP_PATH:+:}/usr/lib64/mozilla/plugins/gmp-gmpopenh264/system-installed"
    export MOZ_GMP_PATH
fi
