{
  ament_cmake,
  ament_cmake_gmock,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rcpputils,
  rcutils,
  rosSystemPackages,
  rosbag2_cpp,
  rosbag2_storage,
  rosbag2_test_common,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    rosbag2_compression-2fa850895e4332769b16213f9877f43fd14926fe = substituteSource {
      src = fetchgit {
        name = "rosbag2_compression-2fa850895e4332769b16213f9877f43fd14926fe-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "2fa850895e4332769b16213f9877f43fd14926fe";
        hash = "sha256-TwkGOmIQgszQ+g6NtNXmyOEEEa8g7Wu6Pc4411a1hSA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_compression";
  version = "0.29.0-1";
  src = sources.rosbag2_compression-2fa850895e4332769b16213f9877f43fd14926fe;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rcpputils rcutils rosbag2_cpp rosbag2_storage ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_lint_auto ament_lint_common rclcpp rosbag2_test_common test_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Compression implementations for rosbag2 bags and messages.";
  };
}
