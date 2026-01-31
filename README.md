The app is configured to listen on port 8080 (as per the Dockerfile using serve).

The image tag idriss98/react-app:latest is a placeholder. In a prod pipeline, this should be replaced with a unique tag from our CI/CD build .

The setup has been tested successfully locally on a Kind cluster with an NGINX Ingress Controller.

For production, the Ingress will need to be updated with the actual domain name and TLS/HTTPS configuration.
