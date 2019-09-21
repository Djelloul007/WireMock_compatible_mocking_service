# E2E Test in a Microservice Architecture

E2E Test in a Microservice Architecture it's a big challenge.
See https://martinfowler.com/articles/microservice-testing/

often in the integration stage a lot of services are unstable or not available that make your test failing,
even though Although your goal was to test your available service.
this unsatisfactory situation.
therefore it is better to mock the other services using tool like Wiremock.

# Benefits of using a mock server
- Reliability
- Determinism
- Avoid rate limits and server costs
- Cover edge cases and error scenarios
- Speed

# Why WireMock?
- Can run on a JVM device or as a standalone service
- Can run as a proxy
- Can record and playback the recorded files
- Can be extended to support more features
- Has an active developers community
- easy to build your own docker image

# Pros & Cons of this approach
- Testing the network layer
- Real conditions
- Easy to maintain
- Easy to simulate scenarios
- Can be shared

# How it work ?

- record the responses from the service to mock see http://wiremock.org/docs/running-standalone/  --proxy-all --record-mappings
- Build the docke image using the Dockerfile "docker build -t mockbackend ." dont forget to copy the mappings & __files
- Run your container          "docker run -d -p 8080:8080 mockbackend"

if you are using Kubernetes its very easy to swap between  external services and the Mock Service. 

# very important 
It is very important that you keep your test data (Mock Data) regularly up to date.

happy testing
your Dj :)
