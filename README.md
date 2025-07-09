# PROXY SETTINGS
NETWORK_LOCATION_NAME=BCN
if [ "$(networksetup -getcurrentlocation)" = "$NETWORK_LOCATION_NAME" ]; then
  export http_proxy=http://localhost:3128
  export https_proxy=$http_proxy
  export no_proxy=localhost,127.0.0.1,.bosch.com,*.bosch.com,::1,10.224.197.250
  export HTTP_PROXY=$http_proxy
  export HTTPS_PROXY=$https_proxy
  export NO_PROXY=$no_proxy
  echo "Network location: $(networksetup -getcurrentlocation) (USING PROXY)"
else
  echo "Network location: $(networksetup -getcurrentlocation) (NOT USING PROXY)"
fi
# USE NANO AS DEFAULT EDITOR INSTEAD OF VIM (FOR EXAMPLE INSIDE VISUDO)
export VISUAL="nano"
export EDITOR=$VISUAL
# FLUTTER
export PATH="$PATH:$HOME/development/flutter/bin"
# ANDROID SDK
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
# GRADLE
export GRADLE_USER_HOME="$HOME/.gradle"
# UNITY 3D and NPM
if [ "$(networksetup -getcurrentlocation)" = "$NETWORK_LOCATION_NAME" ]; then
  export UNITY_PROXYSERVER=$http_proxy
  export UNITY_NOPROXY=$no_proxy
  export NODE_EXTRA_CA_CERTS="$HOME/development/Bosch_Development_Certificates.pem"
fi
