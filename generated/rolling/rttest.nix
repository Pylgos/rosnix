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
        rev = "65d6f7088d03fe7d87ff2bf26281d950f908c4ea";
        hash = "sha256-syi3doCFfPT6ug1jYQqAxc/qkOnPsHMhRIuNszED+ok=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rttest";
  version = "0.18.1-1";
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
