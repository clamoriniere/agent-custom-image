from datadog_checks.base import AgentCheck

__version__ = "1.0.0"
class HelloCheck(AgentCheck):
    def check(self, instance):
        self.gauge('hello.world', 1, tags=['env:dev'])