# nginx-https-redirector

Provides a docker container running nginx which receives connections on port 80 and redirects them to an
https version of the same URL.

The purpose of this is to run behind an ALB (which hosts multiple other websites all served over https
with their own certificates) and receive connections for any domain on port 80 and redirect to the https
version of the site.

The repository includes some limited testing using both inspec and rspec, but all of this is excluded from
the container by the .dockerignore.

To run the tests you first need to build the container and name it nginx-https-redirector:tests

    docker build -t nginx-https-redirector:tests .

Then you can run the tests with rake

    bundle install
    bin/rake
