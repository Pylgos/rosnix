{
  ament_cmake,
  backward_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    moveit_common = substituteSource {
      src = fetchgit {
        name = "moveit_common-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "f8c818a5e307ac81307027fcdebe8906c3e9a3ad";
        hash = "sha256-+nYHvpEkbnYH7o6lx4IhWXvErGHpMSME97pdidmL7wA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_common";
  version = "2.10.0-1";
  src = sources.moveit_common;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Common support functionality used throughout MoveIt";
  };
}
