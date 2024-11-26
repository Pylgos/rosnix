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
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."service_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-core-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-core-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "service_msgs" = substituteSource {
      src = fetchgit {
        name = "service_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "f9bf1b377de941796c64e767b153c766e7c561bf";
        hash = "sha256-eA+Wq22eZ7Jmeh8Q0q99Ji9gdKgAzlDige6OxDalRhs=";
      };
    };
  });
  meta = {
    description = "Messages definitions common among all ROS services";
  };
})
