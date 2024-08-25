{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rtcm_msgs = substituteSource {
      src = fetchgit {
        name = "rtcm_msgs-source";
        url = "https://github.com/ros2-gbp/rtcm_msgs-release.git";
        rev = "79254b5d483f7f53b6915dfb4c74340b3b81de42";
        hash = "sha256-5yTtIdGostlOwChSlKKL4JivCyK284g0KYZxB6GBtBY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rtcm_msgs";
  version = "1.1.6-3";
  src = sources.rtcm_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "The rtcm_msgs package contains messages related to data in the RTCM format.";
  };
}
