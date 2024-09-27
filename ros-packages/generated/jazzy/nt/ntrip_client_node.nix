{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_cppcheck,
  ament_cmake_uncrustify,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libcurl_vendor,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  rtcm_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ntrip_client_node-153c7bdbaf4ecee8decb754480f2443f2fd6b90a = substituteSource {
      src = fetchgit {
        name = "ntrip_client_node-153c7bdbaf4ecee8decb754480f2443f2fd6b90a-source";
        url = "https://github.com/ros2-gbp/ublox_dgnss-release.git";
        rev = "153c7bdbaf4ecee8decb754480f2443f2fd6b90a";
        hash = "sha256-TOR7OmySSgVy4hvBF0qqUpuD20RQeutyTK7ge2x5Cmk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ntrip_client_node";
  version = "0.5.3-2";
  src = sources.ntrip_client_node-153c7bdbaf4ecee8decb754480f2443f2fd6b90a;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ libcurl_vendor rclcpp rclcpp_components rtcm_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_cppcheck ament_cmake_uncrustify ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Publishes RTCM ntrip messages from an external mountpoint";
  };
}
