{
  ament_cmake_copyright,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_lint_cmake,
  ament_cmake_ros,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  point_cloud_transport,
  point_cloud_transport_plugins,
  rclcpp,
  rcpputils,
  rosbag2_cpp,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    point_cloud_transport_tutorial = substituteSource {
      src = fetchgit {
        name = "point_cloud_transport_tutorial-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport_tutorial-release.git";
        rev = "ccd2158c015825d178014cf7a96d1a6e48165bd2";
        hash = "sha256-buQXTqTqhIZJ68B+sbZ3lVovLVRVKBrL7yCCoQygSc8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "point_cloud_transport_tutorial";
  version = "0.0.2-2";
  src = sources.point_cloud_transport_tutorial;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ point_cloud_transport point_cloud_transport_plugins rclcpp rcpputils rosbag2_cpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_lint_cmake ament_cmake_uncrustify ament_cmake_xmllint ];
  missingDependencies = [  ];
  meta = {
    description = "Tutorial for point_cloud_transport.";
  };
}
