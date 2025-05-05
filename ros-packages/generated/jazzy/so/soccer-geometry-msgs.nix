{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "soccer_geometry_msgs";
  version = "1.0.0-2";
  src = finalAttrs.passthru.sources."soccer_geometry_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "soccer_geometry_msgs" = substituteSource {
      src = fetchgit {
        name = "soccer_geometry_msgs-source";
        url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
        rev = "889363aa5db8950eaa22156ff7e66d46ab9acc61";
        hash = "sha256-gMowKNUK3HPz9hWgGtJ8VWq8btZTIYly2Ydi23VUsdA=";
      };
    };
  });
  meta = {
    description = "A package containing msgs that extend geometry_msgs for use in soccer-related packages";
  };
})
