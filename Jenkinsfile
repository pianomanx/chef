pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
      args '--net host -u 0:0 -v /var/run/docker.sock:/var/run/docker.sock'
    }
  }
  stages {
    stage('Chef Cookbook Lint Foodcritic') {
      steps {
        "Chef Cookbook Lint": {
          chef_cookbook_foodcritic()
        }
      }
    },
    stage('Chef Cookbook Lint Cookstyle') {
      steps {
        "Chef Cookbook Lint": {
          chef_cookbook_cookstyle()
        }
      }
    },
    stage('Chef Functional') {
      steps {
        "Chef Cookbook Functional": {
          chef_cookbook_functional()
        }
      }
    },
    stage('Chef Cookbook Unit') {
      steps {
        "Chef Cookbook Unit": {
          chef_cookbook_unit()
        }
      }
      post {
        always {
          warnings(canComputeNew: false, canResolveRelativePaths: false, categoriesPattern: '', consoleParsers: [[parserName: 'ChefCookbookLint']], defaultEncoding: '', excludePattern: '', healthy: '', includePattern: '', messagesPattern: '', unHealthy: '')
          junit '*_junit.xml'
          archive '*_junit.xml'

        }
      }
    }
  }
}
