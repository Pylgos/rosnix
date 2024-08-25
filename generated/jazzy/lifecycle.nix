{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  rclcpp,
  rclcpp_lifecycle,
  ros_testing,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    lifecycle = substituteSource {
      src = fetchgit {
        name = "lifecycle-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "8a97eee798f6d52494e3b2ca858f1b9c5ffb609c";
        hash = "sha256-GWbDRSuuSH51jk1Ag2+oCnn/IXk4Z/RKe27IgZoUEXY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lifecycle";
  version = "0.33.4-1";
  src = sources.lifecycle;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs rclcpp rclcpp_lifecycle std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ros_testing ];
  missingDependencies = [  ];
  meta = {
    description = "Package containing demos for lifecycle implementation";
  };
}
