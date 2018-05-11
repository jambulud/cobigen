CobiGen (Code-based incremental Generator)
==============

:toc:

= Usage

* [Usage of the eclipse UI](https://github.com/devonfw/tools-cobigen/wiki/cobigen-eclipse_usage)
* [OpenAPI Generation](https://github.com/devonfw/tools-cobigen/wiki/cobigen-openapiplugin#usage)
* [Ionic/Cordova Client Generation](https://github.com/devonfw/tools-cobigen/wiki/howto_ionic-client-generation)
* [Angular Client Generation](https://github.com/devonfw/tools-cobigen/wiki/howto_angular-client-generation)
* [Usage in Maven Builds](https://github.com/devonfw/tools-cobigen/wiki/cobigen-maven_configuration)
* [Configuration of the Templates](https://github.com/devonfw/tools-cobigen/wiki/cobigen-core_configuration)

= Installation

* [For eclipse users](https://github.com/devonfw/tools-cobigen/wiki/cobigen-eclipse_installation)

= Architecture

[CobiGen is build as an extensible framework for incremental code generation...](https://github.com/devonfw/tools-cobigen/wiki#architecture)

= Repository Organization

The CobiGen repository is organized in a one-branch-per-plugin schema. By that, we can release each plug-in continously and independently without side effects. On release the plug-in branch is merged to master branch such that you will find all the latest releases of each plug-in on the master branch.

| Top-level folder        | Description |
| ------------- | ------------- |
| `cobigen-documentation`      | Contains git submodules for building and tagging the wiki. |
| `cobigen-eclipse`      | Contains the cobigen eclipse bundles. The implementation of the plug-in is driven in `cobigen-eclipse/cobigen-eclipse` folder.      |
| `cobigen-maven` | Contains the maven plug-in implementation.      |
| `cobigen-review` | Project to be used for [AgileReview](https://github.com/AgileReview-Project/AgileReview-Legacy-Plugin) |
| `cobigen-sample` | Sample code to be used for CobiGen demonstrations |
| `cobigen-templates` | Contains template sets for different architectures |
| `cobigen` | Containts the code implementation of CobiGen as well as all plug-in implementations besides the eclipse plug-in and maven plug-in |
| `ide-settings` | Contains the shared settings processed by the [oasp4j-ide](https://github.com/oasp/oasp4j-ide) |

= Build

You can build CobiGen core as well as each plug-in besides the eclipse plug-in separately by stepping into the plug-in folder, e.g. for the Java plug-in you could step into `cobigen/cobigen-javaplugin` and run `mvn clean install` to build the plug-in and deploy it into your local repository.

The CobiGen eclipse plug-in can build build by running `mvn clean package -Pp2-build-maven`. The profile `p2-build-maven` builds the eclipse plug-in by retrieving eclipse mars bundles as dependencies. Without specifying the profile, the build will fail.

= Deploy

CobiGen deployment has to be distinguished threefold
 
| Component | Deployment Type | Commands |
| ------------- | ------------- | ------------- |
|  `cobigen/cobigen-core/`,`cobigen-maven/` | MAVEN | `mvn clean deploy` |
|  `cobigen/cobigen-*/` (except core) | ECLIPSE | `# Builds the Manifest and bundles the dependencies` |
| | | `mvn clean package bundle:bundle -Pp2-bundle` |
| | | `# Uses the created bundle and builds a p2 update site for it. Do NOT use clean` |
| | | `mvn install bundle:bundle -Pp2-bundle,p2-build-mars,p2-build-experimental p2:site` |
| | | `# Uploades the p2 update site to the experimental repository. Do NOT use clean` |
| | | `mvn deploy -Pp2-build-mars,p2-build-experimental -Dp2.upload=experimental` |
| `cobigen-eclipse/` | ECLIPSE | `mvn clean deploy -Pp2-build-mars,p2-build-experimental -Dp2.upload=experimental` |

= Contribute

[See the contribution guidelines](https://github.com/devonfw/tools-cobigen/blob/master/.github/CONTRIBUTING.md)
