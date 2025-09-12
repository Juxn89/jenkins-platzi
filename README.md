<!-- Modern Jenkins Docker Image README -->

<h1 align="center" style="font-size:2.5rem; font-weight:700;">
  Jenkins Docker Image <img src="https://www.jenkins.io/images/logos/jenkins/jenkins.png" alt="Jenkins Logo" width="40" style="vertical-align:middle;"/>
</h1>

<p align="center" style="font-size:1.1rem;">
  A production-ready, reproducible Jenkins environment with secure SSL and pre-installed plugins.<br>
  <em>Minimal setup, maximum reliability.</em>
</p>

---

## 🚀 Overview

This repository provides a custom Jenkins Docker image designed for seamless, secure, and automated CI/CD pipelines. It addresses SSL trust issues and streamlines plugin management for a hassle-free Jenkins experience.

---

## 🔒 Secure SSL Trust

- **Problem:** Jenkins inside Docker may fail to connect to update sites due to untrusted SSL certificates (e.g., <a href="https://updates.jenkins.io" target="_blank">updates.jenkins.io</a> via Cloudflare).
- **Solution:**  
  - Dynamically detects the Java truststore path.
  - Fetches and imports the full certificate chain from all Jenkins update domains.
  - Ensures Jenkins can securely connect to update sites out-of-the-box.

---

## 🧩 Plugin Management

- **Automated Plugin Installation:**  
  Uses the official <a href="https://github.com/jenkinsci/plugin-installation-manager-tool" target="_blank">jenkins-plugin-cli</a> to pre-install plugins listed in `plugins.txt` during the Docker build.
- **Reproducibility:**  
  Every build results in a consistent Jenkins environment with all required plugins ready to use.

---

## 🛠️ Included Tools

- <strong>Jenkins</strong> (latest LTS)
- <strong>Git</strong>
- <strong>Node.js</strong> (LTS)
- <strong>Pre-installed Jenkins plugins</strong>
- <strong>Trusted SSL certificates</strong> for Jenkins update sites

---

## 📦 How It Works

> **Prerequisite:**  
> <span style="font-size:1.1em;">🐳</span> You need to have <strong>Docker Desktop</strong> installed on your machine.  
> <a href="https://www.docker.com/products/docker-desktop/" target="_blank">Download Docker Desktop</a> – Essential for building and running the Jenkins container locally.

Once the container is running, access your Jenkins instance at:  
👉 <a href="http://localhost:8080" target="_blank">http://localhost:8080</a>


---

## 📚 Useful Links

- <a href="https://www.jenkins.io/doc/book/installing/docker/" target="_blank">Jenkins Docker Installation Guide</a> – Official documentation for running Jenkins in Docker.
- <a href="https://github.com/jenkinsci/plugin-installation-manager-tool" target="_blank">jenkins-plugin-cli</a> – Tool for managing Jenkins plugins in Docker images.
- <a href="https://www.jenkins.io/doc/book/security/" target="_blank">Jenkins Security Documentation</a> – Best practices for securing Jenkins.

---

<div align="center" style="margin-top:2rem;">
  <span style="font-size:1.1rem;">
    Made with <span style="font-size:1.3em;">❤️</span> &amp; <span style="font-size:1.3em;">☕</span> from Nicaragua, Juan Gómez
    <img src="https://upload.wikimedia.org/wikipedia/commons/1/19/Flag_of_Nicaragua.svg" alt="Nicaragua Flag" width="32" style="vertical-align:middle; margin-left:8px;"/>
  </span>
</div>
