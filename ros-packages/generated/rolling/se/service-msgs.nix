{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-core-generators,
  rosidl-core-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "service_msgs";
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."service_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-core-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-core-runtime ];
  buildInputs = [ ament-cmake rosidl-core-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-core-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "service_msgs" = substituteSource {
      src = fetchgit {
        name = "service_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "c6fbfd2f250c99e4064356e2aff45f4da6dbdb62";
        hash = "sha256-pjdzj7CIPELS+/ljyDxbSC2I7TaA1D6l6N99H6MLxu4=";
      };
    };
  });
  meta = {
    description = "Messages definitions common among all ROS services";
  };
})
