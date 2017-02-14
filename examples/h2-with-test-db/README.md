# DSBuilder-h2-with-test-data Docker Image

This docker image provides an h2 database with test data available, as well as dsbuilder.

This is based on the dsbuilder image which:
* Installs then deploys to the [Wildfly](http://wildfly.org) application platform:
  * the [Teiid](http://teiid.jboss.org) runtime
  * the [Data Services Builder](http://teiiddesigner.jboss.org/ds_builder_summary.html)

In addition it
* Creates an h2 file database
* Imports a customer schema and data into the h2 database

## Getting Started

To get acquainted with docker, see the [Docker Documentation](https://docs.docker.com).

* For installation of docker on linux, see [here](https://docs.docker.com/engine/installation/linux/)
* For installation of docker on windows, see [here](https://docs.docker.com/engine/installation/windows/)
* For installation of docker on mac, see [here](https://docs.docker.com/engine/installation/mac/)

Once both the docker daemon and client are installed, execute the following command. This will download the docker image from its repository and start the wildfly application server.

    docker run -it -p 8081:8081 -p 8443:8443 -p 9990:9990 -p 31000:31000 teiidkomodo/dsbuilder-mysql-usstates

* -i : Runs in interactive mode
* -t : Allocates a psuedo console
* -p : Maps (so allows host access to) the ports from the container
* The 8081 port is only necessary if users wish to directly access the h2 database console directly

When started, the wildfly and h2 servers, in the docker image, will perform as if installed locally on the host.

For an overview of getting started with Data Services Builder please see the [Getting Started](https://developer.jboss.org/wiki/GettingStartedWithDataServicesBuilder) article.

# Changing Configuration

It is possible to override the installed configuration of any docker directory by mounting an host directory. Such a directory is accessible from both the host and docker container. For example, to override the Wildfly configuration directory, the following should be added to the 'run' command above:

    docker run -v $HOST_CONFIG_DIRECTORY:/opt/jboss/wildfly/standalone/configuration ... ...

## Credentials

* Wildfly
  * Management user:    __admin__   password: __secret__
  * Teiid      user:    __user__    password: __user1234!__
* H2
  * user:          __sa__    password:[ no password]
