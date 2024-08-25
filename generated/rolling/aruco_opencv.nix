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
  libyamlcpp,
  python3Packages,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  substituteSource,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    aruco_opencv = substituteSource {
      src = fetchgit {
        name = "aruco_opencv-source";
        url = "https://github.com/ros2-gbp/aruco_opencv-release.git";
        rev = "8a6e6a56f544b99eb6c8be848f1a5a4b9a463d9b";
        hash = "sha256-SidyRIeaYeAZTr6h04wPmYBWhR8Z1YIGnV35sjdHmGY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "aruco_opencv";
  version = "6.0.1-1";
  src = sources.aruco_opencv;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ aruco_opencv_msgs cv_bridge image_transport libyamlcpp python3Packages.numpy python3Packages.opencv4 rclcpp rclcpp_components rclcpp_lifecycle tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_cpplint ament_cmake_lint_cmake ament_cmake_uncrustify ament_cmake_xmllint ament_lint_auto ];
  missingDependencies = [ "python3-img2pdf" ];
  meta = {
    description = "ArUco marker detection using aruco module from OpenCV libraries.";
  };
}
