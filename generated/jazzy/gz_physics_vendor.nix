{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  buildRosPackage,
  bullet,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  gbenchmark,
  gz_cmake_vendor,
  gz_common_vendor,
  gz_dartsim_vendor,
  gz_math_vendor,
  gz_plugin_vendor,
  gz_utils_vendor,
  sdformat_vendor,
  substituteSource,
}:
let
  sources = rec {
    gz_physics_vendor = substituteSource {
      src = fetchgit {
        name = "gz_physics_vendor-source";
        url = "https://github.com/ros2-gbp/gz_physics_vendor-release.git";
        rev = "53288c00b4ac180945be5466ce87a9e1b1f32366";
        hash = "sha256-iDCkqgePD0uE6dcCI23Zq502xOXwGQ9b0iyMmHs94lk=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_physics_vendor-vendor_source-gz-physics-0}";
        }
      ];
    };
    gz_physics_vendor-vendor_source-gz-physics-0 = substituteSource {
      src = fetchgit {
        name = "gz_physics_vendor-vendor_source-gz-physics-0-source";
        url = "https://github.com/gazebosim/gz-physics.git";
        rev = "f54d4ded615626d3cff34a5dcfa0cedfe8bd903f";
        hash = "sha256-PTalEQc9C/QsYMO+XK7aOzZUzC01jxiW6bjdItB5hlM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_physics_vendor";
  version = "0.0.4-1";
  src = sources.gz_physics_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [ eigen gbenchmark gz_cmake_vendor gz_math_vendor gz_utils_vendor ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bullet gz_common_vendor gz_dartsim_vendor gz_plugin_vendor sdformat_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ];
  missingDependencies = [ "gz-physics7" ];
  meta = {
    description = "Vendor package for: gz-physics7 7.3.0 Gazebo Physics : Physics classes and functions for robot applications";
  };
}
