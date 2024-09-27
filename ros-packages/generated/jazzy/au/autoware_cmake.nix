{
  ament_cmake_auto,
  ament_lint_auto,
  autoware_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    autoware_cmake-f180036d1d4661a5758129e22e5c74375308e6d8 = substituteSource {
      src = fetchgit {
        name = "autoware_cmake-f180036d1d4661a5758129e22e5c74375308e6d8-source";
        url = "https://github.com/ros2-gbp/autoware_cmake-release.git";
        rev = "f180036d1d4661a5758129e22e5c74375308e6d8";
        hash = "sha256-uNWJEFHdKrWaAM3S5MTv2SI5xia8uBU4BdoPu0+jjpc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_cmake";
  version = "1.0.0-1";
  src = sources.autoware_cmake-f180036d1d4661a5758129e22e5c74375308e6d8;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_auto ament_lint_auto ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_auto ament_lint_auto ros_environment ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto autoware_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "CMake scripts for Autoware";
  };
}
