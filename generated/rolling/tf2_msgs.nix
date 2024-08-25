{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
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
    tf2_msgs = substituteSource {
      src = fetchgit {
        name = "tf2_msgs-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "f0a62d46309e2f380187ede79465c5a3d1d641be";
        hash = "sha256-WZBFYxSn4bAymupq2tcRiGXIYRsc9KjcnYZqbJtla80=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_msgs";
  version = "0.38.2-1";
  src = sources.tf2_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "tf2_msgs";
  };
}
