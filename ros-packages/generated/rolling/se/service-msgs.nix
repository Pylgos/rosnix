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
  version = "2.4.1-1";
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
        rev = "f583bce60e7e23838bfa9efefcf531207b03109b";
        hash = "sha256-fU5t/C8faUD6kTxe5fwSnbH2BluXn50G50uZFaT3pXk=";
      };
    };
  });
  meta = {
    description = "Messages definitions common among all ROS services";
  };
})
