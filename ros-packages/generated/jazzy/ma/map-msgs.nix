{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "map_msgs";
  version = "2.4.1-2";
  src = finalAttrs.passthru.sources."map_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ nav-msgs rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "map_msgs" = substituteSource {
      src = fetchgit {
        name = "map_msgs-source";
        url = "https://github.com/ros2-gbp/navigation_msgs-release.git";
        rev = "4675ed3bf06517781914cb22ee88628485cf7b78";
        hash = "sha256-M1If3wiTKnM4fAey6QfTAMmUHRGIf83bzE1VuxSlGvw=";
      };
    };
  });
  meta = {
    description = "This package defines messages commonly used in mapping packages.";
  };
})
