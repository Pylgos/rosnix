{
  ament_cmake,
  backward_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    moveit_common-b1ffb678975e6d1b97c6dea75f3cd26a26b1592e = substituteSource {
      src = fetchgit {
        name = "moveit_common-b1ffb678975e6d1b97c6dea75f3cd26a26b1592e-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "b1ffb678975e6d1b97c6dea75f3cd26a26b1592e";
        hash = "sha256-oyXDCWuV4YleDbzgpjYXM1LBn0NDcY5qERtXckiITqM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_common";
  version = "2.11.0-1";
  src = sources.moveit_common-b1ffb678975e6d1b97c6dea75f3cd26a26b1592e;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ backward_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Common support functionality used throughout MoveIt";
  };
}
