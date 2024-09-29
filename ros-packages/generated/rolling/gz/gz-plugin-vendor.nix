{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-cmake-vendor-package,
  ament-cmake-xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-cmake-vendor,
  gz-tools-vendor,
  gz-utils-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "gz_plugin_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_plugin_vendor-source";
        url = "https://github.com/ros2-gbp/gz_plugin_vendor-release.git";
        rev = "528f60f197909a91bd48d948a650bd87ae2c9f8e";
        hash = "sha256-6aCXYWo3MSsOxDB4pyhRCK1ID8tyHwnsI1tCnj2aYqU=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_plugin_vendor/gz-plugin"}";
        }
      ];
    };
    "gz_plugin_vendor/gz-plugin" = substituteSource {
      src = fetchgit {
        name = "gz-plugin-source";
        url = "https://github.com/gazebosim/gz-plugin.git";
        rev = "23c28a25aa0c52c87378a28543723b73d475c417";
        hash = "sha256-9t6vcnBbfRWu6ptmqYAhmWKDoKAaK631JD9u1C0G0mY=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "gz-plugin-vendor";
  version = "0.1.0-1";
  src = sources."gz_plugin_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz-cmake-vendor gz-tools-vendor gz-utils-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-plugin2" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Vendor package for: gz-plugin2 2.0.3 Gazebo Plugin : Cross-platform C++ library for dynamically loading plugins.";
  };
}
