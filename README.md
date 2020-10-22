hello.altlab.dev
================

This is a test app used for deploying applications on our new
infrastructure.

If all goes well, you should be able to access this app at <https://hello.altlab.dev/>.


Tasks left for this project:

 - [ ] Create a minimal Dockerfile
    - [ ] Have the Flask app run within Gunicorn or uWSGI
 - [ ] On push to the `production` branch:
     - [ ] Build a Docker image via GitHub Actions
     - [ ] Publish the Docker image to GitHub package repository
     - [ ] Make a secure, authenticated request to <https://deploy.altlab.dev/> to fetch and deploy the latest Docker image for this app
     - [ ] The new code should be deployed at <https://hello.altlab.dev/>
