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
  pkg-config,
  rclcpp,
  rclcpp_components,
  rtcm_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ntrip_client_node = substituteSource {
      src = fetchgit {
        name = "ntrip_client_node-source";
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
  src = sources.ntrip_client_node;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libcurl_vendor rclcpp rclcpp_components rtcm_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_cppcheck ament_cmake_uncrustify ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Publishes RTCM ntrip messages from an external mountpoint";
  };
}
