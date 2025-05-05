{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dynamixel_workbench_msgs";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."dynamixel_workbench_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dynamixel_workbench_msgs" = substituteSource {
      src = fetchgit {
        name = "dynamixel_workbench_msgs-source";
        url = "https://github.com/ros2-gbp/dynamixel_workbench_msgs-release.git";
        rev = "dcd706406ae5a6915ba2c5337965dfda1648e72c";
        hash = "sha256-N24xbzm/t5NM4E4QW/blx5ACQaAaAhiZV31flzdUGJE=";
      };
    };
  });
  meta = {
    description = "\n    This package includes ROS messages and services for dynamixel_workbench packages\n  ";
  };
})
