# Chef Cookbook Pipeline for Jenkins - Cookbook ValidatePip

This Jenkins Pipeline is the first step towards validating cookbook code. 

## Getting Started

The Chef Cookbook Pipeline Plugin for Jenkins makes it easy to build deployment pipelines for Chef cookbooks visually using Jenkins' Blue Ocean plugin. Currently the plugin has unit testing, linting, and functional testing capabilities using the following custom steps:
- Chef Cookbook Unit
- Chef Cookbook Lint (Foodcritic)
- Chef Cookbook Lint (Cookstyle)
- Chef Cookbook Functional
- Chef Cookbook Publish to Chef Server

## Prerequisites

- Jenkins installation, at least version 2.73, with Blue Ocean installed
- A cookbook you want to test
- A few files to put in your cookbook (These files are available on [Github Releases](https://github.com/chef/chef-jenkins-plugin/releases))
  * Dockerfile
  * dot-kitchen.docker.yml
  * Jenkinsfile to describe the pipeline itself

## Installing the Plugin

The easiest way to install the plugin is to download the latest hpi from [Github Releases](https://github.com/chef/chef-jenkins-plugin/releases).

Once this is downloaded login to your Jenkins instance and navigate to manage plugins by clicking manage Jenkins on the left and the manage plugins. Next click the advanced tab and use the upload plugin section to upload and install the hpi.

## Setting up your cookbook

As mentioned in the prerequisites there are three files you will need to checkin to the root of your cookbook. The Dockerfile and Jenkinsfile can be used as is but you'll want to rename the dot-kitchen.docker.yml tp .kitchen.doecker.yml and customize it for the platforms and suites your cookbook uses.

## Creating the Cookbook Pipeline

Go to the Jenkins console and click Open Blue Ocean in the left nav. Click New Pipeline on the ride side of the screen. Blue Ocean will walk you through the creation of a pipeline based on the Jenkinsfile in your cookbook.

Blue Ocean will build and run the cookbook pipeline for you. You should see something similar to the screenshot below, which shows the test cookbook pipeline with unit, lint, and functional stages reporting a Foodcritic failure.

![alt text](readme.png "Chef Test Cookbook Pipeline with Unit, Lint, and Functional Stages reporting Foodcritic Failure")

## ChefDK/Docker Scenario

The plugin supports different topologies, but the variation described here consists of a local standalone workstation running Docker and Jenkins as Jenkins master. To execute the test cookbook pipeline, Jenkins master spins up a Docker container running ChefDK as a Jenkins worker. The stages and steps of the pipeline invoke ChefDK operations which perform unit testing, linting (Foodcritic, Cookstyle), and functional testing (Test Kitchen) of Chef cookbooks. Test Kitchen spins up additional Docker containers as siblings to its own container in which to execute functional testing of cookbooks on different platforms.

## Build Prerequisites

- poise-python


