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
        rev = "875209961463330f80ea29ebf6597e6678135727";
        hash = "sha256-C2+ZxTkM4JIkAgNsq0h2PbqKRjBM9gZ3dJPLy+B4QuY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tlsf_cpp";
  version = "0.18.1-1";
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
