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
    rttest-65d6f7088d03fe7d87ff2bf26281d950f908c4ea = substituteSource {
      src = fetchgit {
        name = "rttest-65d6f7088d03fe7d87ff2bf26281d950f908c4ea-source";
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
  src = sources.rttest-65d6f7088d03fe7d87ff2bf26281d950f908c4ea;
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
