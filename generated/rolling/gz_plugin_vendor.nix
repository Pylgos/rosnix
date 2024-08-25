{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_cmake_vendor,
  gz_tools_vendor,
  gz_utils_vendor,
  substituteSource,
}:
let
  sources = rec {
    gz_plugin_vendor = substituteSource {
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
          to = "VCS_TYPE path VCS_URL ${gz_plugin_vendor-vendor_source-gz-plugin-0}";
        }
      ];
    };
    gz_plugin_vendor-vendor_source-gz-plugin-0 = substituteSource {
      src = fetchgit {
        name = "gz_plugin_vendor-vendor_source-gz-plugin-0-source";
        url = "https://github.com/gazebosim/gz-plugin.git";
        rev = "23c28a25aa0c52c87378a28543723b73d475c417";
        hash = "sha256-9t6vcnBbfRWu6ptmqYAhmWKDoKAaK631JD9u1C0G0mY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_plugin_vendor";
  version = "0.1.0-1";
  src = sources.gz_plugin_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gz_cmake_vendor gz_tools_vendor gz_utils_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ];
  missingDependencies = [ "gz-plugin2" ];
  meta = {
    description = "Vendor package for: gz-plugin2 2.0.3 Gazebo Plugin : Cross-platform C++ library for dynamically loading plugins.";
  };
}
