az aks browse --resource-group cloud-shell-storage-westeurope --name k8s22

Dashboard access control

https://github.com/kubernetes/dashboard/wiki/Access-control#admin-privileges



Enable tiller rbac
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}' 


https://github.com/helm/helm/issues/3130


Kubeflow UI
export NAMESPACE=kubeflow
kubectl port-forward -n ${NAMESPACE}  `kubectl get pods -n ${NAMESPACE} --selector=service=ambassador -o jsonpath='{.items[0].metadata.name}'` 8080:80


Grafana & Prometheus
https://itnext.io/using-prometheus-in-azure-kubernetes-service-aks-ae22cada8dd9

Prometheus
kubectl --namespace monitoring port-forward $(kubectl get pod --namespace monitoring -l prometheus=kube-prometheus -l app=prometheus -o template --template "{{(index .items 0).metadata.name}}") 9090:9090

Grafana
echo username:$(kubectl get secret --namespace monitoring kube-prometheus-grafana -o jsonpath="{.data.user}"|base64 --decode;echo)
echo password:$(kubectl get secret --namespace monitoring kube-prometheus-grafana -o jsonpath="{.data.password}"|base64 --decode;echo)

kubectl --namespace monitoring port-forward $(kubectl get pod --namespace monitoring -l app=kube-prometheus-grafana -o template --template "{{(index .items 0).metadata.name}}") 3000:3000


Argo UI
kubectl -n argo port-forward deployment/argo-ui 8010:8001


Katib UI
kubectl --namespace kubeflow port-forward $(kubectl get pod --namespace kubeflow -l app=vizier -o template --template "{{(index .items 0).metadata.name}}") 8040:80


Jupiter Hub
https://z2jh.jupyter.org/en/stable/setup-jupyterhub.html

