<div align="center">
 <h1>rosnix</h1>
 <p><strong>Effortless ROS 2 Package Management with Nix</strong></p>
</div>

`rosnix` is a nixpkgs overlay providing ROS 2 packages. It is available for almost all Linux distributions.

## 🔧 Key Features

- **🔄 Reproducible Builds**: All builds occur in isolated, dependency-controlled environments, guaranteeing consistent and reproducible outcomes.
- **⚙️ Development Shell**: Provides immediate access to a development environment that replicates the Nix build environment, which is more convenient than container-based development.
- **🖥️ Wide Linux Support**: Works on all Linux distributions supported by Nix.
- **🔗 Dependency Management via Git**: By including the Nix Flakes lock file in your repository, you can manage the versions of all dependency packages with Git.
- **🚀 Always Up-to-Date**: Packages are updated weekly via GitHub Actions to ensure you always have access to the latest versions.

## 🆚 Differences from `nix-ros-overlay`

While `rosnix` is heavily inspired by `nix-ros-overlay`, it offers several unique advantages:

- **📦 Uses `colcon`**: Employs `colcon` for streamlined builds and environment configuration, tailored for ROS 2.
- **🛠 Automatic Vendor Patching**: Automatically parses CMake files to apply necessary patches, minimizing manual intervention.
- **🔍 Precise Dependency Management**: Offers advanced dependency classification for `nativeBuildInputs` and `buildInputs`, enabling better support for cross-compilation.
- **⚙️ System Package Overrides**: Customize system packages flexibly with the `rosSystemPackages` attribute.
- **📁 Per-Distribution Overlays**: Easily manage multiple ROS 2 distributions with specific overlays for each version.

## Flake Outputs
<!---
https://tree.nathanfriend.com/?s=(%27opBs!(%27fancy!Nue~fullPQINailingSlasIrootDot!Nue)~K(%27K%27legacyPGe20nixpkgEinstanc6withF3Tpplied*95ApGeXROS%20pG6fil6LAdevShellXdevelopment%20shellFfU6LAlib*HVlistFf%20supporteJ-*8V8sUQ%20can%20b6passed7oU6W%20M*C9C5*W0MUQ7akeEa%208TnJreturnEanF3Ao3Vo3E4eJfrom%20lib.8s*95%27)~version!%271%27)*AC-H%20nameV%20%23%202s.%3Csystem%3E3verlay4generQ5%3C-%3E...6e%207%20t8config9default*A%5CnBtionC%20%20Es%20F%20oGackagHdisNibuBIh!false~Jd%20Ksource!L4orMfuncBNtrQatT%20aU7hVs0WmkO3X2.L0%01XWVUTQNMLKJIHGFECBA987654320-*
--->
```bash
.
├── legacyPackages.<system> # Nixpkgs instance with overlay applied
│   ├── default
│   └── <distribution names>...
├── packages.<system>.generator # ROS package file generator
├── devShells.<system>.generator # Development shell of the generator
├── lib
│   ├── distributions # List of supported distribution names
│   ├── configs # Configurations that can be passed to the mkOverlay function
│   │   ├── default
│   │   └── <distribution names>...
│   └── mkOverlay # Function that takes a configuration and returns an overlay
└── overlays # Overlays generated from lib.configs
    ├── default
    └── <distribution names>...
```

The Nixpkgs instance with the overlay applied looks like this:

<!--- https://tree.nathanfriend.com/?s=(%27opt3s!(%27fancy!true~fullPat2trailingSlas2rootDot!true)~5(%275%2749extend74-System9getP07system-Configs8tro*4Python*defaultRmwImplementat38ableRmwRuntimeSelect3%27)~vers3!%271%27)*6%20%20-%20p0s%3E...640ackage2h!false~3ion4ros5source!6%5Cn7*%3C8*dis9P0s*%01987654320-* --->
```bash
.
├── rosPackages
│   ├── extend
│   └── <ros packages>...
├── rosSystemPackages
│   ├── getPackage
│   └── <system packages>...
└── rosConfigs
    ├── distro
    ├── rosPython
    ├── defaultRmwImplementation
    └── disableRmwRuntimeSelection
```
