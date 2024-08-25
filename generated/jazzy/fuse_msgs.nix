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
        rev = "9abf81408525991f00ffa99f9b9d52f2143819ef";
        hash = "sha256-K5wgOTOOHaXlC+cqCiC5b5HYQcs38mxUs99d3/wYe44=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_msgs";
  version = "1.1.1-1";
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
