{
  ament_cmake,
  ament_cmake_test,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  ros2cli,
  rosSystemPackages,
  sros2,
  substituteSource,
}:
let
  sources = rec {
    sros2_cmake = substituteSource {
      src = fetchFromGitHub {
        name = "sros2_cmake-source";
        owner = "ros2-gbp";
        repo = "sros2-release";
        rev = "1a083aac5944c3e33072b5dd99adf8d9d1c3b076";
        hash = "sha256-Lk74feQcy27POAavf9+1v/TP/9b5J0tRA/mb7qTBdH0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sros2_cmake";
  version = "0.13.2-1";
  src = sources.sros2_cmake;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_test ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ros2cli sros2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "CMake macros to configure security";
  };
}
