{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    rttest = substituteSource {
      src = fetchgit {
        name = "rttest-source";
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
  src = sources.rttest;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Instrumentation library for real-time performance testing";
  };
}
