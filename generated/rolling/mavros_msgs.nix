{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic_msgs,
  geometry_msgs,
  rcl_interfaces,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    mavros_msgs = substituteSource {
      src = fetchgit {
        name = "mavros_msgs-source";
        url = "https://github.com/ros2-gbp/mavros-release.git";
        rev = "98c65be6302c0ca9ffa9d627c43f1a8747119386";
        hash = "sha256-AWdktlWefd9i32GeYclFTFzF6N2LKeGhVQgrtV9GIvs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mavros_msgs";
  version = "2.8.0-1";
  src = sources.mavros_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geographic_msgs geometry_msgs rcl_interfaces rosidl_default_runtime sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "mavros_msgs defines messages for";
  };
}
