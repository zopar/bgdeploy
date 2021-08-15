# Blue green deployment example

This is a simple example of blue green deployment  
It use traefik as router and traefik.me to resolve your localhost with a dns name  

## Prerequisite

1) docker  
2) docker-compose  
3) wrk  

## How to use

0) run trarfik.sh to start traefik  
1) run deploy.sh  
2) run test.sh in another shell to start wrk as test  
3) Modify a file in app (use master), you can simply add a new line on app.py.  
   Note: based on the repo this works for any file in the repo.  
4) commit you changes  
5) run again deploy.sh  

The system use the commit number to show you that the new app is deployed.It is also in the labels  
at the same time. When the old one is removed you will see only the new commit.  
You have <http://app.traefik.me> that give you "Success!" if the app is working  
You have <http://app.traefik.me/ping> used for health check  
You can go to <http://app.traefik.me/commit> to check the commit number  and commit, you will see that calling this link  
multiple time that the commit can change from the old from the new one, this is because the two deployments live for  
a while and traefik continues to use also the old one until is stopped.  

## Clean all  

run stop.sh  
