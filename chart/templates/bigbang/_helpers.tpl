{{/*
Expand the name of the chart.
*/}}
{{- define "minio.name" -}}
  {{- default .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "minio.fullname" -}}
  {{- $name := default .Chart.Name -}}
  {{- if contains $name .Release.Name -}}
    {{- .Release.Name | trunc 63 | trimSuffix "-" -}}
  {{- else -}}
    {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
  {{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "minio.chart" -}}
  {{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels for minio
*/}}
{{- define "minio.labels" -}}
app.kubernetes.io/name: {{ include "minio.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
helm.sh/chart: {{ include "minio.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels for minio
*/}}
{{- define "minio.selectorLabels" -}}
app.kubernetes.io/name: {{ include "minio.name" . }}
{{- end -}}


{{/*
Create the port used to communicate with the Minio service.
Note: the Minio operator has a fixed name of "minio" for the service it creates.
*/}}
{{- define "minio.servicePort" -}}
{{- if or .Values.upstream.tenant.certificate.requestAutoCert .Values.upstream.tenant.certificate.externalCertSecret }}
443
{{- else }}
9090
{{- end }}
{{- end }}

{{/*
Create the port used to communicate with the Minio API service.
Note: the Minio operator has a fixed name of "minio" for the service it creates.
*/}}
{{- define "api.servicePort" -}}
80
{{- end }}
