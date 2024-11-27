<div align="center">
	<h1>rosnix</h1>
	<p><strong>Effortless ROS 2 Package Management with Nix</strong></p>
</div>

`rosnix` is a package collection designed to manage ROS 2 packages in a simple and reproducible way using the Nix package manager.

## 🔧 Key Features

- **🔄 Reproducible Builds**: All builds are performed in isolated environments with dependencies strictly managed by Nix, ensuring consistent and reliable results.
- **⚙️ Development Shell**: Provides immediate access to a development environment that mirrors the Nix build environment while allowing the use of host tools, offering greater convenience than container-based development.
- **🖥️ Wide Linux Support**: Works on all Linux distributions supported by Nix.
- **🔗 Dependency Management via Git**: By including the Nix Flakes lock file in your repository, you can manage the versions of all dependency packages with Git.
- **🚀 Always Up-to-Date**: Packages are updated daily via GitHub Actions to ensure you always have access to the latest versions.

## 🆚 Differences from `nix-ros-overlay`

While `rosnix` is heavily inspired by `nix-ros-overlay`, it offers several unique advantages:

- **📦 Uses `colcon`**: Leverages `colcon` for building and environment setup.
- **🛠 Automatic Vendor Patching**: Automatically applies vendor patches by parsing CMake files during package generation.
- **🔍 Precise Dependency Management**: Utilizes heuristics and manual adjustments to accurately classify `nativeBuildInputs` and `buildInputs`, enabling cross-compilation for some packages.
- **⚙️ System Package Overrides**: Allows users to override system packages using the `rosSystemPackages` attribute for greater flexibility.
- **📁 Per-Distribution Overlays**: Provides overlays for each ROS 2 distribution, making it easy to manage multiple distributions efficiently.

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
