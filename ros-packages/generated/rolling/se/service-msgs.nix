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
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."service_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-core-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-core-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "service_msgs" = substituteSource {
      src = fetchgit {
        name = "service_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "0e668ffdf14fd4a4716a2bddd8daaa0741ceaa0c";
        hash = "sha256-SdQzzUihCSMkVEiU1HJTrq6CruNOMqQ6OxV58TnrnDY=";
      };
    };
  });
  meta = {
    description = "Messages definitions common among all ROS services";
  };
})
