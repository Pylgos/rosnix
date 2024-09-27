{
  ament_cmake,
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
    rmw_implementation_cmake-88d851830e56ae6e8f8bf1b09b856e0f8c81eb7b = substituteSource {
      src = fetchgit {
        name = "rmw_implementation_cmake-88d851830e56ae6e8f8bf1b09b856e0f8c81eb7b-source";
        url = "https://github.com/ros2-gbp/rmw-release.git";
        rev = "88d851830e56ae6e8f8bf1b09b856e0f8c81eb7b";
        hash = "sha256-eqlVZn8jHaQRoZJEjE+HiH+RtfK70hgE5sOCTuXTpLQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_implementation_cmake";
  version = "7.4.3-1";
  src = sources.rmw_implementation_cmake-88d851830e56ae6e8f8bf1b09b856e0f8c81eb7b;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "CMake functions which can discover and enumerate available implementations.";
  };
}
