{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  libspnav,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  spacenavd,
  substituteSource,
}:
let
  sources = rec {
    spacenav = substituteSource {
      src = fetchgit {
        name = "spacenav-source";
        url = "https://github.com/ros2-gbp/joystick_drivers-release.git";
        rev = "d5e13eaca0ffde926e41a100f3a23638fece1334";
        hash = "sha256-5WXkdmHcAdaPaMSMNcTfScbDq9VNmFSb7jofUAAHyAk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "spacenav";
  version = "3.3.0-2";
  src = sources.spacenav;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs libspnav rclcpp rclcpp_components sensor_msgs spacenavd ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "ROS interface to the 3Dconnexion SpaceNavigator 6DOF joystick.";
  };
}
