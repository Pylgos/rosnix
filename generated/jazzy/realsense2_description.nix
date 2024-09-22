{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_ros,
  rclcpp,
  rclcpp_components,
  realsense2_camera_msgs,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    realsense2_description = substituteSource {
      src = fetchFromGitHub {
        name = "realsense2_description-source";
        owner = "IntelRealSense";
        repo = "realsense-ros-release";
        rev = "dbdca2538210cac2b854291ba47f099df80224d9";
        hash = "sha256-Er8wmje8+L8O8X37B/c7pa22cwsjuK21LnWLzY2bo0c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "realsense2_description";
  version = "4.55.1-3";
  src = sources.realsense2_description;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ launch_ros rclcpp rclcpp_components realsense2_camera_msgs xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RealSense description package for Intel 3D D400 cameras";
  };
}
