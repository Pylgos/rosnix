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
  rosSystemPackages,
  rosbag2_cpp,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    point_cloud_transport_tutorial-ccd2158c015825d178014cf7a96d1a6e48165bd2 = substituteSource {
      src = fetchgit {
        name = "point_cloud_transport_tutorial-ccd2158c015825d178014cf7a96d1a6e48165bd2-source";
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
  src = sources.point_cloud_transport_tutorial-ccd2158c015825d178014cf7a96d1a6e48165bd2;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ point_cloud_transport point_cloud_transport_plugins rclcpp rcpputils rosbag2_cpp sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_lint_cmake ament_cmake_uncrustify ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Tutorial for point_cloud_transport.";
  };
}
