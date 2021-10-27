#!/bin/sh
wait_project() {
   timeElapsed=0
   while true; do
      resourceHealth=$(kubectl get tenant -n minio -o jsonpath='{.items[0].status.healthStatus}' | xargs)     # Update with the resource to check and jsonpath
      if [[ $resourceHealth == "green" ]]; then                                             # Update with desired health/output of the jsonpath
        echo "minio custom resource creation finished"
         break
      fi
      sleep 5
      timeElapsed=$(($timeElapsed+5))
      if [[ $timeElapsed -ge 600 ]]; then
         echo "timeout waiting 600 seconds for minio resource creation, running describe..." 1>&2
         kubectl describe tenant -n minio 1>&2
         exit 1
      fi
   done
}
