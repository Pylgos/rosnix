{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch,
  launch_ros,
  python3Packages,
  rclpy,
  substituteSource,
  tf2_ros,
  turtlesim,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtle_tf2_py = substituteSource {
      src = fetchgit {
        name = "turtle_tf2_py-source";
        url = "https://github.com/ros2-gbp/geometry_tutorials-release.git";
        rev = "d9008b745c653f26866657c862bdfcabc147214c";
        hash = "sha256-YrWOCB771U+0NaRQRIHJxiMl6neFFGabMomNQawWucU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtle_tf2_py";
  version = "0.5.0-1";
  src = sources.turtle_tf2_py;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs launch launch_ros rclpy tf2_ros turtlesim ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "turtle_tf2_py demonstrates how to write a ROS2 Python tf2 broadcaster and listener with the turtlesim. The turtle_tf2_listener commands turtle2 to follow turtle1 around as you drive turtle1 using the keyboard.";
  };
}
