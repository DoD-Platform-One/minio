#!/bin/sh
wait_project() {
   timeElapsed=0
   while true; do
      resourceHealth=$(kubectl get tenant -A -o jsonpath='{.items[0].status.healthStatus}' | xargs)     # Update with the resource to check and jsonpath
      if [[ $resourceHealth == "green" ]]; then                                             # Update with desired health/output of the jsonpath
         break
      fi
      sleep 5
      timeElapsed=$(($timeElapsed+5))
      if [[ $timeElapsed -ge 600 ]]; then
         exit 1
      fi
   done
}
