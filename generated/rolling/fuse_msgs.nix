{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    fuse_msgs = substituteSource {
      src = fetchgit {
        name = "fuse_msgs-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "e9a1f4fb66c892b9cd3c11d16bc3e596a35819fd";
        hash = "sha256-g0UgyBiYXdseeSLUmZ6iu8RAQmpsEH/EAxRlZx/0kQQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_msgs";
  version = "1.2.0-1";
  src = sources.fuse_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "The fuse_msgs package contains messages capable of holding serialized fuse objects.";
  };
}
