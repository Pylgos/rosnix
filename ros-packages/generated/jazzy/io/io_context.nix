{
  ament_cmake_auto,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  asio_cmake_module,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rosSystemPackages,
  std_msgs,
  substituteSource,
  udp_msgs,
}:
let
  sources = rec {
    io_context-3a6f852f38351b39895ea0189258a87938b80de6 = substituteSource {
      src = fetchgit {
        name = "io_context-3a6f852f38351b39895ea0189258a87938b80de6-source";
        url = "https://github.com/ros2-gbp/transport_drivers-release.git";
        rev = "3a6f852f38351b39895ea0189258a87938b80de6";
        hash = "sha256-RINF/bmOZEexBa8eMAkn2J1r1NOrze8SI3fx1t/ywak=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "io_context";
  version = "1.2.0-4";
  src = sources.io_context-3a6f852f38351b39895ea0189258a87938b80de6;
  nativeBuildInputs = [ ament_cmake_auto asio_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp std_msgs udp_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "asio" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A library to write Synchronous and Asynchronous networking applications";
  };
}
