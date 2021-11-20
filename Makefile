.PHONY: build
build:
	mkdir -p ./bin
	go build -o ./bin

.PHONY: build-image-kind
build-image-kind:
	docker build -t localhost:5000/validating-webhook:latest .

.PHONY: push-kind
push-kind:
	docker push localhost:5000/validating-webhook:latest

.PHONY: deploy
deploy:
	kubectl apply -f ./kubernetes/webhook-deployment.yaml
	kubectl apply -f ./kubernetes/webhook-service.yaml
	kubectl apply -f ./kubernetes/validating-webhook-config.yaml

.PHONY: cleanup
cleanup:
	kubectl delete -f ./kubernetes/webhook-deployment.yaml
	kubectl delete -f ./kubernetes/webhook-service.yaml
	kubectl delete -f ./kubernetes/validating-webhook-config.yaml
	kubectl delete -f ./kubernetes/test-pod.yaml
