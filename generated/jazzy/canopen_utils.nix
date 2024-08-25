{
  ament_lint_auto,
  buildRosPackage,
  canopen_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  rclpy,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    canopen_utils = substituteSource {
      src = fetchgit {
        name = "canopen_utils-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "181beef157c2ca0a620517759160ed38a96b752b";
        hash = "sha256-6Wm4mQlXmkNgHkDqu2NDjeeA/4QXqqxc0vWdyftHwgc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_utils";
  version = "0.2.9-2";
  src = sources.canopen_utils;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ canopen_interfaces lifecycle_msgs rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ];
  missingDependencies = [  ];
  meta = {
    description = "Utils for working with ros2_canopen.";
  };
}
