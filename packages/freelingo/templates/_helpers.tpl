{{/*
Expand the name of the chart.
*/}}
{{- define "freelingo.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "freelingo.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "freelingo.labels" -}}
helm.sh/chart: {{ include "freelingo.name" . }}-{{ .Chart.Version | replace "+" "_" }}
{{ include "freelingo.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: vgurukool-platform
{{- end }}

{{/*
Selector labels
*/}}
{{- define "freelingo.selectorLabels" -}}
app.kubernetes.io/name: {{ include "freelingo.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
