{
  ament_cmake,
  ament_cmake_vendor_package,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "orocos_kdl_vendor" = substituteSource {
      src = fetchgit {
        name = "orocos_kdl_vendor-source";
        url = "https://github.com/ros2-gbp/orocos_kdl_vendor-release.git";
        rev = "cdb25798979b61d7591030abc06923438eaf990c";
        hash = "sha256-UMCjg5ol7D43QHfQX9G3elox5GLUsHb5Q93TExrjorc=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/orocos/orocos_kinematics_dynamics.git";
          to = "VCS_TYPE path VCS_URL ${sources."orocos_kdl_vendor/orocos_kinematics_dynamics"}";
        }
      ];
    };
    "orocos_kdl_vendor/orocos_kinematics_dynamics" = substituteSource {
      src = fetchgit {
        name = "orocos_kinematics_dynamics-source";
        url = "https://github.com/orocos/orocos_kinematics_dynamics.git";
        rev = "ce4bcb65a050615b6d7f21bc60fbb2656515791b";
        hash = "sha256-CfmwMQEg/tRVNaGglBZ94pBwva49mJJwkbSjhqzG2Pw=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "orocos_kdl_vendor";
  version = "0.6.1-1";
  src = sources."orocos_kdl_vendor";
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ eigen3_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "liborocos-kdl-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Wrapper around orocos_kdl, providing nothing but a dependency on orocos_kdl on some systems. On others, it fetches and builds orocos_kdl locally.";
  };
}