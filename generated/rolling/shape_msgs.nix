{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    shape_msgs = substituteSource {
      src = fetchgit {
        name = "shape_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "f20ef5cf36184023870a21277e9cb7bd4366edfa";
        hash = "sha256-Xzlep1d4PPY5cRyWth6pJmiscyubhdvffnfzGAMt9NI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "shape_msgs";
  version = "5.4.1-1";
  src = sources.shape_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A package containing some message definitions which describe geometric shapes.";
  };
}
