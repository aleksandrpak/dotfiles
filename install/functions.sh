at_google() {
    # Check if the system is Linux and if "gcert" binary is present
    if [[ "$(uname -s)" == "Linux" && -x "$(command -v gcert)" ]]; then
        return 0  # True
    else
        return 1  # False
    fi
}
