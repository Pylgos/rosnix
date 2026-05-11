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
  service-msgs,
  substituteSource,
  unique-identifier-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "action_msgs";
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."action_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-core-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-core-runtime service-msgs unique-identifier-msgs ];
  buildInputs = [ ament-cmake rosidl-core-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-core-runtime service-msgs unique-identifier-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "action_msgs" = substituteSource {
      src = fetchgit {
        name = "action_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "f7c38a7b37d4d531dc23aefd3f6f43d302a0e475";
        hash = "sha256-m2ekK+lY/Ro+OKvebm4CBDaW3wCvo4DdptexZfQtSyA=";
      };
    };
  });
  meta = {
    description = "Messages and service definitions common among all ROS actions.";
  };
})
