{
  ament_cmake,
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ament_cmake,
  launch_testing_ros,
  python3Packages,
  rclpy,
  rosapi,
  rosbridge_library,
  rosbridge_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    rosbridge_server = substituteSource {
      src = fetchgit {
        name = "rosbridge_server-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "b919417d664d0594c44dfcd7294381a0632c6186";
        hash = "sha256-t1Tj/Y8NdOi7Yunvx/UfIz5LF9ZGXrf9BSc9bUPdaT8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbridge_server";
  version = "1.3.2-2";
  src = sources.rosbridge_server;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.tornado python3Packages.twisted rclpy rosapi rosbridge_library rosbridge_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ launch launch_ros launch_testing launch_testing_ament_cmake launch_testing_ros python3Packages.autobahn std_srvs ];
  missingDependencies = [  ];
  meta = {
    description = "A WebSocket interface to rosbridge.";
  };
}
