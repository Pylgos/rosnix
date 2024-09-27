{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    fuse_msgs-dfb1a85e9e5edf52c099aed99eef080dbb5d25d7 = substituteSource {
      src = fetchgit {
        name = "fuse_msgs-dfb1a85e9e5edf52c099aed99eef080dbb5d25d7-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "dfb1a85e9e5edf52c099aed99eef080dbb5d25d7";
        hash = "sha256-1MCYwjqTXGSqeLZnuIgbYUWZSiIHDpzEniamI5tCiYA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_msgs";
  version = "1.2.1-1";
  src = sources.fuse_msgs-dfb1a85e9e5edf52c099aed99eef080dbb5d25d7;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The fuse_msgs package contains messages capable of holding serialized fuse objects.";
  };
}
