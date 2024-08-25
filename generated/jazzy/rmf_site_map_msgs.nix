{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    rmf_site_map_msgs = substituteSource {
      src = fetchgit {
        name = "rmf_site_map_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "2499966df824e46199a90238cbe273a9e3eff560";
        hash = "sha256-k0Vuz81CsgXUmBvVR/uZY7Tc0Wg11MHSYYFy/oswRQ0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_site_map_msgs";
  version = "3.3.1-1";
  src = sources.rmf_site_map_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Messages that contain GeoPackage maps";
  };
}
