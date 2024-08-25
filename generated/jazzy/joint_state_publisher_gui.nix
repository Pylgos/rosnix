{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher,
  python_qt_binding,
  rclpy,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    joint_state_publisher_gui = substituteSource {
      src = fetchgit {
        name = "joint_state_publisher_gui-source";
        url = "https://github.com/ros2-gbp/joint_state_publisher-release.git";
        rev = "21816fed55bedeedc28f78d7a028f6bc75729f01";
        hash = "sha256-ZumKM1KrbYTFo3f4tigUBtyVcxNOVbG2+FR7x85ZLhM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "joint_state_publisher_gui";
  version = "2.4.0-3";
  src = sources.joint_state_publisher_gui;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher python_qt_binding rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "This package contains a GUI tool for setting and publishing joint state values for a given URDF.";
  };
}
