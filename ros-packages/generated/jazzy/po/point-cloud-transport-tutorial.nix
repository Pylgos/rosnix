{
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-lint-cmake,
  ament-cmake-ros,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  point-cloud-transport,
  point-cloud-transport-plugins,
  rclcpp,
  rcpputils,
  rosSystemPackages,
  rosbag2-cpp,
  sensor-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "point_cloud_transport_tutorial" = substituteSource {
      src = fetchgit {
        name = "point_cloud_transport_tutorial-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport_tutorial-release.git";
        rev = "ccd2158c015825d178014cf7a96d1a6e48165bd2";
        hash = "sha256-buQXTqTqhIZJ68B+sbZ3lVovLVRVKBrL7yCCoQygSc8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "point_cloud_transport_tutorial";
  version = "0.0.2-2";
  src = sources."point_cloud_transport_tutorial";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ point-cloud-transport point-cloud-transport-plugins rclcpp rcpputils rosbag2-cpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-lint-cmake ament-cmake-uncrustify ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Tutorial for point_cloud_transport.";
  };
}
