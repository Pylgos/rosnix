{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joy_teleop,
  key_teleop,
  substituteSource,
  teleop_tools_msgs,
}:
let
  sources = rec {
    teleop_tools = substituteSource {
      src = fetchgit {
        name = "teleop_tools-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "e6b979265d244329719510fe08fe55830e0e1222";
        hash = "sha256-WmN/i4ppTEs6mXUMJhIIuv+z4LYd+SuJ/61i+YUORhw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "teleop_tools";
  version = "1.5.0-3";
  src = sources.teleop_tools;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joy_teleop key_teleop teleop_tools_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "A set of generic teleoperation tools for any robot.";
  };
}
