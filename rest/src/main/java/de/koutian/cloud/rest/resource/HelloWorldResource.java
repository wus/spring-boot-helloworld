package de.koutian.cloud.rest.resource;

import java.net.InetAddress;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

@Path(HelloWorldResource.HELLO)
public class HelloWorldResource {

    static final String HELLO = "/hello";

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String sayHello(@QueryParam(value = "name") final String name) throws Exception {
        return InetAddress.getLocalHost() + " says: Servus " + name;
    }
}
