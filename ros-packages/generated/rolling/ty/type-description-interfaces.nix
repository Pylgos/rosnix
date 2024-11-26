{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-core-generators,
  rosidl-core-runtime,
  service-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "type_description_interfaces";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."type_description_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-core-generators ];
  propagatedBuildInputs = [ rosidl-core-runtime service-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "type_description_interfaces" = substituteSource {
      src = fetchgit {
        name = "type_description_interfaces-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "457d2d32df52e364022352bf9c377b778082891b";
        hash = "sha256-E3QuQ0C5Hk5c5RcbjRJoZuENdkYjG05x5X3YyMhA85Y=";
      };
    };
  });
  meta = {
    description = "A package containing message and service definitions for describing and communicating descriptions of other types.";
  };
})
