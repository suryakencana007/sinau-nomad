job "redis" {
  datacenters = ["dc1"]

  group "cache" {
    network {
        port "db" {
            to = 6379
        }
    }

    task "redis-task" {
      driver = "containerd-driver"

      config {
        image    = "redis:alpine"
        hostname = "foobar"
        seccomp  = true
        cwd      = "/home/redis"
        ports    = ["db"]
      }

      resources {
        cpu        = 500
        memory     = 256
        memory_max = 512
      }
    }
  }
}
