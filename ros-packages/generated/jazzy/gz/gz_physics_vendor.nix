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
  gz_common_vendor,
  gz_dartsim_vendor,
  gz_math_vendor,
  gz_plugin_vendor,
  gz_utils_vendor,
  mkSourceSet,
  rosSystemPackages,
  sdformat_vendor,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "gz_physics_vendor" = substituteSource {
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
          to = "VCS_TYPE path VCS_URL ${sources."gz_physics_vendor/gz-physics"}";
        }
      ];
    };
    "gz_physics_vendor/gz-physics" = substituteSource {
      src = fetchgit {
        name = "gz-physics-source";
        url = "https://github.com/gazebosim/gz-physics.git";
        rev = "f54d4ded615626d3cff34a5dcfa0cedfe8bd903f";
        hash = "sha256-PTalEQc9C/QsYMO+XK7aOzZUzC01jxiW6bjdItB5hlM=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "gz_physics_vendor";
  version = "0.0.4-1";
  src = sources."gz_physics_vendor";
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "benchmark" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz_cmake_vendor gz_common_vendor gz_dartsim_vendor gz_math_vendor gz_plugin_vendor gz_utils_vendor sdformat_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "bullet" "eigen" "gz-physics7" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Vendor package for: gz-physics7 7.3.0 Gazebo Physics : Physics classes and functions for robot applications";
  };
}