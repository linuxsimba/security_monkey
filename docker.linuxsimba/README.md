# Installing SecurityMonkey with OpenStack

## Build security monkey with no AWS hooks

```
docker-compose build securitymonkey
```

## Install SecurityMonkey with no AWS hooks


```
docker-compose up -d
```

## Modifications

SecurityMonkey config for this particular setup is in
docker.linuxsimba/config-deploy.py.noaws


## References

Nagww-dockersecurity project. Helped me figure out how to create self signed
certificates.




