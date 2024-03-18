***Stack Overflow Reference***

## [Where to place requirements.yml for Ansible and use it to resolve dependencies?](https://stackoverflow.com/questions/55773505/where-to-place-requirements-yml-for-ansible-and-use-it-to-resolve-dependencies)

### [Accepted Answer](https://stackoverflow.com/a/55774721)

Technically speaking, you could put your `requirements.yml` file anywhere you like as long as you reflect the correct path in your `ansible-galaxy install` command.

Meanwhile, if you ever want to run your playbooks from Ansible Tower/Awx, I suggest you stick to the [Ansible Tower requirements](https://docs.ansible.com/ansible-tower/latest/html/userguide/projects.html#ansible-galaxy-support) and put your `requirements.yml` file in `<project-top-level-directory>/roles/requirements.yml`

Regarding dependencies between roles, `ansible-galaxy` is able to follow them by itself when they are encountered during installation. So you don't need to specify all of them in your `requirements.yml`, only top level ones. You just need to specify your dependencies correctly in each external roles.

#### In `meta/main.yml` for role1
```yaml
dependencies:
  - src: https://my.scm.com/my-ansible-roles/role2.git
    scm: git
    version: master
    name: role2
  - src: https://my.scm.com/my-ansible-roles/role3.git
    scm: git
    version: master
    name: role3
```

#### In `meta/main.yml` for role2
```yaml
dependencies:
  - src: https://my.scm.com/my-ansible-roles/role4.git
    scm: git
    version: master
    name: role4
  - src: https://my.scm.com/my-ansible-roles/role5.git
    scm: git
    version: master
    name: role5
```

#### `roles/requirements.yml`
```yaml
---
- src: https://my.scm.com/my-ansible-roles/role1.git
  scm: git
  version: master
  name: role1
```

To be as exhaustive as possible, this is what I now usually do on my projects to handle dependencies locally as well as local/project only roles

#### Basic project structure
```
ansible-project-dir
└─── roles
|    └─── locally-versioned-role1
|    └─── locally-versioned-role2
|    └─── ...
|    └─── requirements.yml
|    └─── .gitignore
└─── ansible.cfg
└─── playbook1.yml
└─── playbook2.yml
```

#### `ansible.cfg`
I force roles search and downloads in the local `roles` directory by setting `roles_path  = roles`, so user can use `ansible-galaxy install` without the `-p` parameter.

#### `roles/requirements.yml`
Already discussed above. Just list dependencies to top-level external (i.e. not versioned in the project) as galaxy role name or as git uris. If you need to fully checkout those roles to later make git commits/push on them, you can use `ansible-galaxy install -g -f -r roles/requirements`

#### `roles/.gitignore`
```yaml
# Ignore everything in roles dir
/*
# Except:
# the .gitignore file
!.gitignore
# the requirements file
!requirements.yml
# Readme if you have one
!README.md
# and any specific role we want to version locally
!locally-versioned-role*/


```
