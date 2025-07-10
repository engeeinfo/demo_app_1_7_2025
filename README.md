cat << EOF > $HOME/.gradle/gradle.properties
# PROXY SETTINGS
systemProp.http.proxyHost=localhost
systemProp.http.proxyPort=3128
systemProp.http.nonProxyHosts=localhost|127.0.0.1|.bosch.com|*.bosch.com
systemProp.https.proxyHost=localhost
systemProp.https.proxyPort=3128
systemProp.https.nonProxyHosts=localhost|127.0.0.1|.bosch.com|*.bosch.com
EOF



 localhost,127.0.0.1,.bosch.com,*.bosch.com

 https://inside-ws.bosch.com/FIRSTspiritWeb/permlink/wcms_so_-Bosch_Internal_SSL_Certificates_Startpage-EN

 $HOME/development/Bosch_Development_Certificates.pem

 sudo /Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home/jre/bin/keytool -import -alias Bosch_Development_Certificates -keystore /Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home/jre/lib/security/cacerts -storepass changeit -file $HOME/development/Bosch_Development_Certificates.pem -noprompt

 export VISUAL="nano"
export EDITOR=$VISUAL


sudo visudo


Defaults        env_keep += "HTTP_PROXY HTTPS_PROXY NO_PROXY UNITY_PROXYSERVER UNITY_NOPROXY"
Defaults        env_keep += "ANDROID_SDK_ROOT GRADLE_USER_HOME"
