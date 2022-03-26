#!/usr/bin/env groovy
@Library("com.optum.jenkins.pipeline.library@master") _
node ('docker-kitchensink-slave') {
 glGitCheckout()
 pipeline_data = readYaml file: "pipeline.yml"
}
def GIT_BRANCH_STORED
pipeline {
 agent none
 options {
 timestamps()
 }
 environment {
 NODEJS_VERSION = '14'
 KUBECTL_VERSION = '1.18.5'
 SERVICE_WORKER = "$pipeline_data.serviceAccount"
 NPM_EMAIL = 'noreply@optum.com'
 NPM_AUTH_KEY =
"dW5pX3JwYV9hbmtfMTpBUDlHbWR2SG5kZ1p3Y0RqMXVRRHNnYnE0V3E="
 GIT_CREDENTIALS_ID = "gittokencred"
 DOCKER_REPO = "$pipeline_data.image.repository"
 DOCKER_REPO_NAMESPACE = "$pipeline_data.image.namespace"
 DOCKER_IMAGE = "$pipeline_data.image.name"
 }
stages {
stage('Git Variables') {
 agent {
 label 'docker-kitchensink-slave'
 }
 steps {
 glGitGetInfo()
 store("${GIT_BRANCH}")
 println("${GIT_BRANCH}")
 }
 }
stage('Build,Sonar') {
 when {
 beforeAgent true
 not { buildingTag() }
 }
 parallel {
 stage('Build AND Sonar') {
 agent {
 label 'docker-kitchensink-slave'
 }
 stages {
 stage('Build') {
 steps {
 script
 {
 sh """


 npm install
 """
 }
 stash includes:
"$pipeline_data.compiledCodePath", name: 'compiled_code'
 }
 }
 /* stage('Test') {
 steps {
 unstash 'compiled_code'
 script
 {
 sh """
 npm test
 """
 }
 }
 }*/
 stage('Sonar') {
 steps {
 unstash 'compiled_code'
 glSonarNpmScan gitUserCredentialsId: "$
{env.GIT_CREDENTIALS_ID}"
 }
 }
 }
 }
 }
 }
stage('Docker Build') {
 when {
 beforeAgent true
 not { buildingTag() }
 }
 agent { label 'docker-kitchensink-slave' }
 steps {
 unstash 'compiled_code'
 glDockerImageBuildPush(
 image: "${DOCKER_REPO}/$
{DOCKER_REPO_NAMESPACE}/${DOCKER_IMAGE}:${getTag()}",
 credentialsId: SERVICE_WORKER,
 containerRegistry: DOCKER_REPO
 )
 }
 }
/*stage('Test Container') {
 failFast true
 when {
 beforeAgent true
 not { buildingTag() }
 }
 parallel {
 stage('Twistlock') {
 agent { label 'docker-kitchensink-slave' }
 steps {
 glDockerImagePull(
 image: "${DOCKER_REPO}/$
{DOCKER_REPO_NAMESPACE}/${DOCKER_IMAGE}:${getTag()}",
 credentialsId: SERVICE_WORKER,
 containerRegistry: DOCKER_REPO
 )
 glTwistlockScan(
 dockerRepository: "${DOCKER_REPO}/$
{DOCKER_REPO_NAMESPACE}/${DOCKER_IMAGE}:${getTag()}",
 twistlockCredentials: SERVICE_WORKER
 )
 }
 }
 }
 }*/
stage('Deploy to NonProd') {

 agent {
 label 'docker-kitchensink-slave'
 }
 steps {
 script {
 sh """

 sed -i 's|@app@|
$pipeline_data.deployment.labels.app|;s|@deploymentconfig@|
$pipeline_data.deployment.labels.deploymentconfig|;
 s|@name@|
$pipeline_data.deployment.deploymentName|;s|@namespace@|
$pipeline_data.deployment.namespace|;
 s|@lcpu@|
$pipeline_data.deployment.resources.limits.cpu|;s|@rcpu@|
$pipeline_data.deployment.resources.requests.cpu|;
 s|@lmem@|
$pipeline_data.deployment.resources.limits.memory|;s|@rmem@|
$pipeline_data.deployment.resources.requests.memory|;
 s|@image@|${DOCKER_REPO}/$
{DOCKER_REPO_NAMESPACE}/${DOCKER_IMAGE}:${getTag()}|;s|
@containerPort@|$pipeline_data.deployment.containerPort|;
 s|@drop@|
$pipeline_data.deployment.capabilities.drop|;s|@runAsUser@|
$pipeline_data.deployment.runAsUser|;
 s|@lp@|
$pipeline_data.deployment.probes.livenessProbe.cmd|;s|@rp@|
$pipeline_data.deployment.probes.readinessProbe.cmd|' deploy/
deployment.yaml

 sed -i 's|@app@|
$pipeline_data.service.labels.app|;s|@deploymentconfig@|
$pipeline_data.service.labels.deploymentconfig|;
 s|@name@|
$pipeline_data.service.name|;s|@namespace@|
$pipeline_data.service.namespace|;
 s|@port@|
$pipeline_data.service.port|;s|@targetPort@|
$pipeline_data.service.targetPort|;
 s|@type@|$pipeline_data.service.type|'
deploy/service.yaml

 sed -i 's|@app@|
$pipeline_data.ingress.labels.app|;s|@deploymentconfig@|
$pipeline_data.ingress.labels.deploymentconfig|;
 s|@name@|
$pipeline_data.ingress.name|;s|@namespace@|
$pipeline_data.ingress.namespace|;
 s|@hosts@|
$pipeline_data.ingress.tls.hosts|;s|@secretName@|
$pipeline_data.ingress.tls.secretName|;
 s|@host@|
$pipeline_data.ingress.rules.host|;s|@path@|
$pipeline_data.ingress.rules.path1|;
 s|@serviceName@|
$pipeline_data.ingress.rules.backend.serviceName|;s|
@servicePort@|
$pipeline_data.ingress.rules.backend.servicePort|;' deploy/
ingress.yaml
 sed -i 's|@app@|
$pipeline_data.policy.labels.app|;s|@deploymentconfig@|
$pipeline_data.policy.labels.deploymentconfig|;
 s|@name@|
$pipeline_data.policy.name|;s|@port@|
$pipeline_data.policy.ingress.port|' deploy/
networkPolicy.yaml



 """
 glKubernetesApply credentials:
"$pipeline_data.k8s.nonprod.token",
 cluster:
"$pipeline_data.k8s.nonprod.clusterUrl",
 clusterPort:
"$pipeline_data.k8s.nonprod.clusterPort",
 namespace:
"$pipeline_data.k8s.nonprod.namespace",
 yamls: ["deploy/
deployment.yaml","deploy/service.yaml","deploy/
ingress.yaml","deploy/networkPolicy.yaml"],
 deleteIfExists:
true
 }
 }
 }
}
}
void store(GString gitBranch) {
 GIT_BRANCH_STORED = gitBranch
}
String getEnvName() {
 return GIT_BRANCH_STORED.tokenize(".")[2]
}
String getGitTag(String deploymentPlatform, String
deploymentType, String deploymentEnvironment, String
deploymentUser) {
 deploymentUser = deploymentUser.replaceAll("[,]",
"").replaceAll(" ", "_").toLowerCase()
 return "${deploymentPlatform}.${deploymentType}.$
{deploymentEnvironment}.${BUILD_NUMBER}.${GIT_COMMIT_SHORT}.$
{currentBuild.startTimeInMillis}.${deploymentUser}"
}
String getTag() {
 return "${BUILD_NUMBER}.${GIT_COMMIT_SHORT}"
}
void approvePromotion(String emailAddress, String approverId,
String environment, String datacenter) {
 datacenter = datacenter.toUpperCase()
 environment = environment.capitalize()
 emailext body: "Approval requested for build URL:
$BUILD_URL. Requesting to deploy to $environment. Please
ensure you won't be overwriting a build under test.",
 subject: "$datacenter $environment: Approval requested
for ${pipeline_data.appName}",
 to: emailAddress
 glApproval message: "Approve for deployment to $datacenter
$environment?", submitter: approverId
}
