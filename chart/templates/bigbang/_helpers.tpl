{{/*
Bigbang labels
*/}}
{{- define "bigbang.labels" -}}
app: {{ template "minio-operator.name" . }}
{{- if .Chart.AppVersion }}
version: {{ .Chart.AppVersion | quote }}
{{- end }}
{{- end }}
