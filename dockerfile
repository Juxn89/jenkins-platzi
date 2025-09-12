FROM jenkins/jenkins:lts

USER root

# Install basic tools
RUN apt-get update && \
    apt-get install -y curl gnupg ca-certificates software-properties-common

# Copy the plugins.txt file
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

# Install Jenkins plugins
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

# Install Git from default repositories
RUN apt-get update && \
    apt-get install -y git

# Install Node.js LTS from NodeSource
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get install -y nodejs npm

# Detect the Java keystore path automatically
RUN CACERTS_PATH=$(find /opt/java -name cacerts 2>/dev/null | head -n 1) && \
    for host in get.jenkins.io updates.jenkins.io; do \
				echo "Downloading certificate chain from $host..." && \
        echo | openssl s_client -showcerts -connect $host:443 -servername $host 2>/dev/null \
        | awk '/BEGIN CERTIFICATE/{i++} {print > "/usr/local/share/ca-certificates/"host"_"i".crt"}' host=$host && \
        for crt in /usr/local/share/ca-certificates/${host}_*.crt; do \
            alias_name=$(basename "$crt" .crt) && \
						echo "Importing $alias_name into the keystore..." && \
            keytool -importcert \
                -keystore "$CACERTS_PATH" \
                -storepass changeit \
                -noprompt \
                -alias "$alias_name" \
                -file "$crt" || true ; \
        done ; \
    done && \
		echo "Verifying imported certificates..." && \
    keytool -list -keystore "$CACERTS_PATH" -storepass changeit | grep jenkins.io

# Verify versions (optional for debug)
RUN git --version && node -v && npm -v

USER jenkins