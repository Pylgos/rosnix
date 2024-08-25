{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  diagnostic_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    camera_aravis2_msgs = substituteSource {
      src = fetchgit {
        name = "camera_aravis2_msgs-source";
        url = "https://github.com/ros2-gbp/camera_aravis2-release.git";
        rev = "779f712fb162187e4c606b1dc4f533d39939481c";
        hash = "sha256-uJNlVnQ0C6eoW8P7lIvVPeQwCegOvlodYxLCKO6fv1Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "camera_aravis2_msgs";
  version = "1.0.0-1";
  src = sources.camera_aravis2_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces diagnostic_msgs rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Messages and service definitions for the camera_aravis2 package.";
  };
}
