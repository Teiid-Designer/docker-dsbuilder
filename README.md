# DSBuilder Docker Image

This is a docker image that deploys [Data Services Builder](http://teiiddesigner.jboss.org/ds_builder_summary.html) on the [Teiid](http://teiid.jboss.org) runtime and [Wildfly](http://wildfly.org) application platform.

## Getting Started

To get acquainted with docker, see the [Docker Documentation](https://docs.docker.com).

* For installation of docker on linux, see [here](https://docs.docker.com/engine/installation/linux/)
* For installation of docker on windows, see [here](https://docs.docker.com/engine/installation/windows/)
* For installation of docker on mac, see [here](https://docs.docker.com/engine/installation/mac/)

Once both the docker daemon and client are installed, execute the following command. This will download the docker image from its repository and start the wildfly application server.

    docker run -it -p 8443 -p 9900 -p 31000 teiidkomodo/dsbuilder

* -i : Runs in interactive mode
* -t : Allocates a psuedo console
* -p : Maps (so allows host access to) the ports from the container

When started, the wildfly server in the docker image will perform as if it was installed locally on the host.

For an overview of getting started with Data Services Builder please see the [Getting Started](https://developer.jboss.org/wiki/GettingStartedWithDataServicesBuilder).
