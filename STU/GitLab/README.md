# GitLab

```shell
docker run -d -p 46080:46080 -p:46022:22 -p 46081:80 -h www.gitlab.wolves.top --name gitlab --restart always -v /data/gitlab-ce/config:/etc/gitlab -v /data/gitlab-ce/logs:/var/log/gitlab -v /data/gitlab-ce/data:/var/opt/gitlab gitlab/gitlab-ce:latest
```

