# BagIt Library (BIL)

## Description

The BAGIT LIBRARY is a software library intended to support the creation,
manipulation, and validation of bags. Its current version is 0.97. It is version aware with the earliest
supported version being 0.93.

### Examples of using the new bagit-java library

##### Create a bag from a folder using version 0.97

```java
Path folder = Paths.get("FolderYouWantToBag");
StandardSupportedAlgorithms algorithm = StandardSupportedAlgorithms.MD5;
boolean includeHiddenFiles = false;
Bag bag = BagCreator.bagInPlace(folder, Arrays.asList(algorithm), includeHiddenFiles);
```

##### Read an existing bag (version 0.93 and higher)

```java
Path rootDir = Paths.get("RootDirectoryOfExistingBag");
BagReader reader = new BagReader();
Bag bag = reader.read(rootDir);
```

##### Write a Bag object to disk

```java
Path outputDir = Paths.get("WhereYouWantToWriteTheBagTo");
BagWriter.

write(bag, outputDir); //where bag is a Bag object
```

##### Verify Complete

```java
boolean ignoreHiddenFiles = true;
BagVerifier verifier = new BagVerifier();
verifier.

isComplete(bag, ignoreHiddenFiles);
```

##### Verify Valid

```java
boolean ignoreHiddenFiles = true;
BagVerifier verifier = new BagVerifier();
verifier.

isValid(bag, ignoreHiddenFiles);
```

##### Quickly verify by payload-oxum

```java
boolean ignoreHiddenFiles = true;

if(BagVerifier.

canQuickVerify(bag)){
        BagVerifier.

quicklyVerify(bag, ignoreHiddenFiles);
}
```

##### Add other checksum algorithms

You only need to implement 2 interfaces:

```java
public class MyNewSupportedAlgorithm implements SupportedAlgorithm {
    @Override
    public String getMessageDigestName() {
        return "SHA3-256";
    }

    @Override
    public String getBagitName() {
        return "sha3256";
    }
}

public class MyNewNameMapping implements BagitAlgorithmNameToSupportedAlgorithmMapping {
    @Override
    public SupportedAlgorithm getMessageDigestName(String bagitAlgorithmName) {
        if ("sha3256".equals(bagitAlgorithmName)) {
            return new MyNewSupportedAlgorithm();
        }

        return StandardSupportedAlgorithms.valueOf(bagitAlgorithmName.toUpperCase());
    }
}
```

and then add the implemented `BagitAlgorithmNameToSupportedAlgorithmMapping`
class to your `BagReader` or `bagVerifier` object before using their methods.

#### Check for potential problems

The BagIt format is extremely flexible and allows for some conditions which are
technically allowed but should be avoided to minimize confusion and maximize
portability. The `BagLinter` class allows you to easily check a bag for
warnings:

```java
Path rootDir = Paths.get("RootDirectoryOfExistingBag");
BagLinter linter = new BagLinter();
List<BagitWarning> warnings = linter.lintBag(rootDir, Collections.emptyList());
```

You can provide a list of specific warnings to ignore:

```java
dependencycheckth rootDir = Paths.get("RootDirectoryOfExistingBag");
BagLinter linter = new BagLinter();
List<BagitWarning> warnings = linter.lintBag(rootDir, Arrays.asList(BagitWarning.OLD_BAGIT_VERSION);
```

## Using bagit-java library in java (Maven) projects

For using this package inside your JAVA applications, two files need modifications. Firstly, you will need to modify ```
pom.xml``` by adding a package source and the dependency itself.

### pom.xml

#### Source definition:

```xml

<project>
    ...
    <properties>
        <PROJECT_ID>211</PROJECT_ID>
        <dimag.gitlab.endpoint>https://gitlab.la-bw.de/api/v4/projects/${PROJECT_ID}/packages/maven
        </dimag.gitlab.endpoint>
    </properties>

    <repositories>
        <repository>
            <id>gitlab-maven</id>
            <url>${dimag.gitlab.endpoint}</url>
        </repository>
    </repositories>
    <distributionManagement>
        <repository>
            <id>gitlab-maven</id>
            <url>${dimag.gitlab.endpoint}</url>
        </repository>
        <snapshotRepository>
            <id>gitlab-maven</id>
            <url>${dimag.gitlab.endpoint}</url>
        </snapshotRepository>
    </distributionManagement>
    ...
</project>
```

#### Dependency definition:

```xml

<dependency>
    <groupId>de.dimag</groupId>
    <artifactId>bagit-java</artifactId>
    <version>version</version>
</dependency>
```

### settings.xml

Since the Gitlab instance is not public you will need to tell Maven a private token oder or user credentials to log in
and download the package. This is done by modifying the ```settings.xml``` in you .m2-folder (on Windows machines
commonly
%USERPROFILE%\\.m2).

```xml

<settings>
    <servers>
        <server>
            <id>gitlab-maven</id>
            <configuration>
                <httpHeaders>
                    <property>
                        <name>Private-Token</name>
                        <value>YOUR-TOKEN-GOES-HERE</value>
                    </property>
                </httpHeaders>
            </configuration>
        </server>
    </servers>
</settings>
```
