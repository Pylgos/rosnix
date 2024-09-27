{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rttest-19a193b3d09bcc656177b5df025466181096871d = substituteSource {
      src = fetchgit {
        name = "rttest-19a193b3d09bcc656177b5df025466181096871d-source";
        url = "https://github.com/ros2-gbp/realtime_support-release.git";
        rev = "19a193b3d09bcc656177b5df025466181096871d";
        hash = "sha256-DzzoynuB0QJTrIEO6Y6FHd2Im5vR4jSXYc/6IFcZ65o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rttest";
  version = "0.17.0-3";
  src = sources.rttest-19a193b3d09bcc656177b5df025466181096871d;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Instrumentation library for real-time performance testing";
  };
}
