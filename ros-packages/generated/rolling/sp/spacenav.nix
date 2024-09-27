{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    spacenav-d5e13eaca0ffde926e41a100f3a23638fece1334 = substituteSource {
      src = fetchgit {
        name = "spacenav-d5e13eaca0ffde926e41a100f3a23638fece1334-source";
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
  src = sources.spacenav-d5e13eaca0ffde926e41a100f3a23638fece1334;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rclcpp rclcpp_components sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libspnav-dev" "spacenavd" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS interface to the 3Dconnexion SpaceNavigator 6DOF joystick.";
  };
}
