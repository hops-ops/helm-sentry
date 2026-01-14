import models.ai.com.ops.hops.helm.v1alpha1 as helmv1alpha1
import models.io.upbound.dev.meta.v1alpha1 as metav1alpha1

_items = [
    metav1alpha1.CompositionTest {
        metadata.name = "minimal-renders-helm-release"
        spec = {
            compositionPath = "apis/sentries/composition.yaml"
            xrdPath = "apis/sentries/definition.yaml"
            timeoutSeconds = 60
            validate = False
            xr = helmv1alpha1.Sentry {
                metadata.name = "test-sentry"
                spec.clusterName = "test-cluster"
            }
            assertResources = [
                {
                    apiVersion = "helm.m.crossplane.io/v1beta1"
                    kind = "Release"
                    metadata.name = "test-sentry"
                }
            ]
        }
    }

    metav1alpha1.CompositionTest {
        metadata.name = "custom-labels-merged"
        spec = {
            compositionPath = "apis/sentries/composition.yaml"
            xrdPath = "apis/sentries/definition.yaml"
            timeoutSeconds = 60
            validate = False
            xr = helmv1alpha1.Sentry {
                metadata.name = "labeled-sentry"
                spec = {
                    clusterName = "test-cluster"
                    labels = {team = "platform"}
                }
            }
            assertResources = [
                {
                    apiVersion = "helm.m.crossplane.io/v1beta1"
                    kind = "Release"
                    metadata = {
                        name = "labeled-sentry"
                        labels = {
                            "hops.ops.com.ai/managed" = "true"
                            "hops.ops.com.ai/sentry" = "labeled-sentry"
                            team = "platform"
                        }
                    }
                }
            ]
        }
    }

    metav1alpha1.CompositionTest {
        metadata.name = "override-all-values"
        spec = {
            compositionPath = "apis/sentries/composition.yaml"
            xrdPath = "apis/sentries/definition.yaml"
            timeoutSeconds = 60
            validate = False
            xr = helmv1alpha1.Sentry {
                metadata.name = "override-test"
                spec = {
                    clusterName = "my-cluster"
                    overrideAllValues = {fullnameOverride = "custom-sentry"}
                }
            }
            assertResources = [
                {
                    apiVersion = "helm.m.crossplane.io/v1beta1"
                    kind = "Release"
                    metadata.name = "override-test"
                    spec.forProvider.values = {fullnameOverride = "custom-sentry"}
                }
            ]
        }
    }
]

items = _items
