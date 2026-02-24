# How to upgrade the Minio Package chart

Upgrading the minio instance can be a a little tricky since there are a number of changes that are unique to the minio instance deployed by Big Bang.
You can not simply do a kpt pull and replace since there are unique changes that must be maintained.   This is because of the way the minio tenant was originally deployed by
in the upstream minio operator charts.

1. Checkout the branch that renovate created. This branch will have the image tag updates and typically some other necessary version changes that you will want. You can either work off of this branch or branch off of it.
2. Update version references for the Chart in chart/Chart.yaml. version should be `<version>-bb.0` (ex: `1.14.3-bb.0`) and appVersion should be the upstream version (ex: `1.14.3`). Also validate that the BB annotation for the main Minio version is updated (leave the Tetrate version as-is unless you are updating those images).
3. Verify that chart/values.yaml tag and tidTAG have been updated to the new version.
4.Add a changelog entry for the update. At minimum mention updating the image versions.
5. Generate the `README.md` updates by following the [guide in gluon](https://repo1.dso.mil/platform-one/big-bang/apps/library-charts/gluon/-/blob/master/docs/bb-package-readme.md).
6.Open an MR in "Draft" status (or check the one that Renovate creates for the issue) and validate that CI passes. This will perform a number of smoke tests against the package, but it is good to manually deploy to test some things that CI doesn't. Follow the steps below for manual testing.
7.Once all manual testing is complete take your MR out of "Draft" status, add the review label, add any necessary upgrade notices (if none you will need to put N/A), add any screenshots/logs/etc. as proof that your changes work (these are required), assign yourself as the assignee, and add reviewers.

 # Testing new Minio version

New minio version should be manually tested on botch a clean install and an upgrade from BB master.

Local install:
1. Clean install:
install minio-operator and minio from your branch using deployment steps.
1. Upgrade:
install current versions of minio-operator and minio, and upgrade to your branch. Ensure both minio-operator and minio have upgraded to the newer versions.
1. Test:
navigate to minio.bigbang.dev.  Log in (credentials can be found in /chart/values.yaml).  Create test bucket and verify creation.  Delete test bucket and verify deletion.

Pipeline:
modify [MinIO](https://repo1.dso.mil/platform-one/big-bang/apps/application-utilities/minio/-/blob/main/tests/dependencies.yaml) package dependency to point to your branch/version and create an MR


## Branch/Tag Config

If you'd like to install from a specific branch or tag, then the code block under minio needs to be uncommented and used to target your changes.

```

addons:
  minio:
    <other config/labels>
    ...
    ...

    # Add git branch or tag information to test against a specific branch or tag instead of using `main`
    # Must set the unused label to null
    git:
      tag: null
      branch: "renovate/ironbank"

```

### Cluster setup

⚠️ Always make sure your local bigbang repo is current before deploying.

1. Export your Ironbank/Harbor credentials (this can be done in your `~/.bashrc` or `~/.zshrc` file if desired). These specific variables are expected by the `k3d-dev.sh` script when deploying metallb, and are referenced in other commands for consistency:
    ```
    export REGISTRY_USERNAME='<your_username>'
    export REGISTRY_PASSWORD='<your_password>'
    ```
1. Export the path to your local bigbang repo (without a trailing `/`):

  	⚠️ Note that wrapping your file path in quotes when exporting will break expansion of `~`.
    ```
    export BIGBANG_REPO_DIR=<absolute_path_to_local_bigbang_repo>
    ```
    e.g.
    ```
    export BIGBANG_REPO_DIR=~/repos/bigbang
    ```
1. Run the [k3d_dev.sh](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/docs/assets/scripts/developer/k3d-dev.sh) script to deploy a dev cluster (`-a` flag required if deploying a local Keycloak):

    For `login.dso.mil` Keycloak:

    ```
    "${BIGBANG_REPO_DIR}/docs/assets/scripts/developer/k3d-dev.sh"
    ```

    For local `keycloak.dev.bigbang.mil` Keycloak (`-a` deploys instance with a second public IP and metallb):

    ```
    "${BIGBANG_REPO_DIR}/docs/assets/scripts/developer/k3d-dev.sh -a"
    ```
1. Export your kubeconfig:

    ```
    export KUBECONFIG=~/.kube/<your_kubeconfig_file>
    ```
    e.g.
    ```
    export KUBECONFIG=~/.kube/Sam.Sarnowski-dev-config
    ```
1. [Deploy flux to your cluster](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/scripts/install_flux.sh):
    ```
    "${BIGBANG_REPO_DIR}/scripts/install_flux.sh -u ${REGISTRY_USERNAME} -p ${REGISTRY_PASSWORD}"

# Deploying

⚠️ Note that testing against your local branch or tag is only possible if you edit the overrides file to point to your changes.

From the root of this repo, run one of the following deploy commands depending on which Keycloak you wish to reference:

For `login.dso.mil` Keycloak:

```
helm upgrade -i bigbang ${BIGBANG_REPO_DIR}/chart/ -n bigbang --create-namespace \
--set registryCredentials.username=${REGISTRY_USERNAME} --set registryCredentials.password=${REGISTRY_PASSWORD} \
-f https://repo1.dso.mil/big-bang/bigbang/-/raw/master/tests/test-values.yaml \
-f https://repo1.dso.mil/big-bang/bigbang/-/raw/master/chart/ingress-certs.yaml \
-f https://repo1.dso.mil/big-bang/bigbang/-/raw/master/docs/assets/configs/example/dev-sso-values.yaml \
-f docs/dev-overrides/minimal.yaml \
-f docs/dev-overrides/minio-testing.yaml
```

For local `keycloak.dev.bigbang.mil` Keycloak:

```
helm upgrade -i bigbang ${BIGBANG_REPO_DIR}/chart/ -n bigbang --create-namespace \
--set registryCredentials.username=${REGISTRY_USERNAME} --set registryCredentials.password=${REGISTRY_PASSWORD} \
-f https://repo1.dso.mil/big-bang/bigbang/-/raw/master/tests/test-values.yaml \
-f https://repo1.dso.mil/big-bang/bigbang/-/raw/master/chart/ingress-certs.yaml \
-f docs/dev-overrides/minimal.yaml \
-f docs/dev-overrides/minio-testing-local-keycloak.yaml
```

- Authservice (with minio Dependency), Keycloak
- Kiali and Monitoring (including Grafana), all with SSO enabled

## Validation/Testing Steps

Local install:
1. Clean install:
install minio-operator and minio from your branch using deployment steps above.
1. Upgrade:
install current versions of minio-operator and minio, and upgrade to your branch. Ensure both minio-operator and minio have upgraded to the newer versions.
1. Test:
navigate to minio.bigbang.dev.  Log in (credentials can be found in /chart/values.yaml).  Create test bucket and verify creation.  Delete test bucket and verify deletion.

Pipeline:
modify [MinIO](https://repo1.dso.mil/platform-one/big-bang/apps/application-utilities/minio/-/blob/main/tests/dependencies.yaml) package dependency to point to your branch/version and create an MR

# Files that need integration testing

If you modify any of these things, you should perform an integration test with your branch against the rest of bigbang. Some of these files have automatic tests already defined, but those automatic tests may not model corner cases found in full integration scenarios.

* `./chart/templates/bigbang/*`
* `./chart/values.yaml` if it involves any of:
  * monitoring changes
  * network policy changes
  * kyverno policy changes
  * istio hardening rule changes
  * service definition changes
  * TLS settings
  * server ingress settings
  * headless server settings (especially port or other comms settings)

Follow [the standard process](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/docs/developer/test-package-against-bb.md?ref_type=heads) for performing an integration test against bigbang.

### Big Bang Integration Testing

As part of your MR that modifies bigbang packages, you should modify the bigbang  [bigbang/tests/test-values.yaml](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/tests/test-values.yaml?ref_type=heads) against your branch for the CI/CD MR testing by enabling your packages. 

    - To do this, at a minimum, you will need to follow the instructions at [bigbang/docs/developer/test-package-against-bb.md](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/docs/developer/test-package-against-bb.md?ref_type=heads) with changes for Redis enabled (the below is a reference, actual changes could be more depending on what changes were made to Redis in the package MR).

### [test-values.yaml](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/tests/test-values.yaml?ref_type=heads)
    ```yaml
    addons:
      authservice:
        enabled: true
        git:
          tag: ""
          branch: "your-branch"
        values:
          monitoring:
          enabled: true
          redis:
            enabled: true
          redis-bb:
            monitoring:
              enabled: true
            metrics:
              enabled: true # To test redis-exporter image
      ### Additional compononents of Redis should be changed to reflect testing changes introduced in the package MR
    ```

# automountServiceAccountToken
The mutating Kyverno policy named `update-automountserviceaccounttokens` is leveraged to harden all ServiceAccounts in this package with `automountServiceAccountToken: false`. This policy is configured by namespace in the Big Bang umbrella chart repository at [chart/templates/kyverno-policies/values.yaml](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/chart/templates/kyverno-policies/values.yaml?ref_type=heads).

This policy revokes access to the K8s API for Pods utilizing said ServiceAccounts. If a Pod truly requires access to the K8s API (for app functionality), the Pod is added to the `pods:` array of the same mutating policy. This grants the Pod access to the API, and creates a Kyverno PolicyException to prevent an alert.

# Deploying with modifications to tenant pool definitions
At this time, tenant definitions are replaced by the last array provided in the merge order.  This means any user override will completely replace default values provided in the chart which may result in key configurations being removed.

To resolve this issue, when modifying or applying new tenant pool definitions, all values must be duplicated in the user override chart (ex: `securityContext`, `containerSecurityContext`, `automountServiceAccountToken`, etc.).

Initial basic values for a single minio tenant pool can be found in `chart/values.yaml`.
