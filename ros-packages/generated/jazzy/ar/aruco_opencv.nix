{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_cpplint,
  ament_cmake_lint_cmake,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_lint_auto,
  aruco_opencv_msgs,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  mkSourceSet,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  rosSystemPackages,
  substituteSource,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = mkSourceSet (sources: {
    "aruco_opencv" = substituteSource {
      src = fetchgit {
        name = "aruco_opencv-source";
        url = "https://github.com/ros2-gbp/aruco_opencv-release.git";
        rev = "2627ed963f4a6e887754f8e910c15689f0b5c89f";
        hash = "sha256-SidyRIeaYeAZTr6h04wPmYBWhR8Z1YIGnV35sjdHmGY=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "aruco_opencv";
  version = "6.0.1-1";
  src = sources."aruco_opencv";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ aruco_opencv_msgs cv_bridge image_transport rclcpp rclcpp_components rclcpp_lifecycle tf2_geometry_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-img2pdf" "python3-opencv" "yaml-cpp" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_cpplint ament_cmake_lint_cmake ament_cmake_uncrustify ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ArUco marker detection using aruco module from OpenCV libraries.";
  };
}
