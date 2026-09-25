{{/*
Expand the name of the chart.
*/}}
{{- define "lector.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "lector.fullname" -}}
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
{{- define "lector.labels" -}}
helm.sh/chart: {{ include "lector.name" . }}-{{ .Chart.Version | replace "+" "_" }}
{{ include "lector.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: vgurukool-platform
{{- end }}

{{/*
Selector labels
*/}}
{{- define "lector.selectorLabels" -}}
app.kubernetes.io/name: {{ include "lector.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
