# Installing SecurityMonkey with OpenStack

## Build security monkey with no AWS hooks

```
docker-compose build securitymonkey
```

## Install SecurityMonkey with no AWS hooks


> NOTE: Start postgres first before the other containers so that
postgres comes up before securitymonkey.  Going to add a wait script
eventually to get it to come up cleanly. Reference
https://docs.docker.com/compose/startup-order/

```
docker-compose up -d postgres (WAIT 1 minute)
docker-compose up -d
```

## Modifications

SecurityMonkey config for this particular setup is in
docker.linuxsimba/config-deploy.py.noaws


## References

Nagww-dockersecurity project. Helped me figure out how to create self signed
certificates.




