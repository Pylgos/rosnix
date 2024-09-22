{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_cmake_vendor,
  gz_common_vendor,
  gz_dartsim_vendor,
  gz_math_vendor,
  gz_plugin_vendor,
  gz_utils_vendor,
  rosSystemPackages,
  sdformat_vendor,
  substituteSource,
}:
let
  sources = rec {
    gz_physics_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "gz_physics_vendor-source";
        owner = "ros2-gbp";
        repo = "gz_physics_vendor-release";
        rev = "ce8d83b9f90bea0e2d3cc9fbb4211377f4e374f9";
        hash = "sha256-UBvXwdHVvlQTBd/sRNkkyz79U6wFP+0eaCVpR5CgGg4=";
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
      src = fetchFromGitHub {
        name = "gz_physics_vendor-vendor_source-gz-physics-0-source";
        owner = "gazebosim";
        repo = "gz-physics";
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
  version = "0.1.1-1";
  src = sources.gz_physics_vendor;
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
