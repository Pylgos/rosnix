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
  version = "2.0.3-5";
  src = finalAttrs.passthru.sources."dynamixel_workbench_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dynamixel_workbench_msgs" = substituteSource {
      src = fetchgit {
        name = "dynamixel_workbench_msgs-source";
        url = "https://github.com/ros2-gbp/dynamixel_workbench_msgs-release.git";
        rev = "dc300702741bf35a25967aba0a7465a453890fca";
        hash = "sha256-NMrVMFxbUmSDCdSRTO6gRJtKsmEeqY4Q5FqkBQCeY3I=";
      };
    };
  });
  meta = {
    description = "This package includes ROS messages and services for dynamixel_workbench packages";
  };
})
