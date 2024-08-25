{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rmw,
  rmw_implementation_cmake,
  std_msgs,
  substituteSource,
  tlsf,
}:
let
  sources = rec {
    tlsf_cpp = substituteSource {
      src = fetchgit {
        name = "tlsf_cpp-source";
        url = "https://github.com/ros2-gbp/realtime_support-release.git";
        rev = "8f622c3e255fcd12fc402170b139b3347ef75baf";
        hash = "sha256-cREflSs5wBd1xMcnVyiq5H1VkfQCR1AKoYN2/u4T7nQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tlsf_cpp";
  version = "0.17.0-3";
  src = sources.tlsf_cpp;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rmw std_msgs tlsf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common rmw_implementation_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "C++ stdlib-compatible wrapper around tlsf allocator and ROS2 examples";
  };
}
