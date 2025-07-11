sudo /Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home/jre/bin/keytool \
-import \
-alias Bosch_Development_Certificates \
-keystore /Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home/jre/lib/security/cacerts \
-storepass changeit \
-file "$HOME/development/Bosch_Development_Certificates.pem" \
-noprompt
.

sudo /usr/lib/jvm/java-17-openjdk/bin/keytool
