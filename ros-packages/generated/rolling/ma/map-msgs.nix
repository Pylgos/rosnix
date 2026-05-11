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
  version = "2.6.1-1";
  src = finalAttrs.passthru.sources."map_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ nav-msgs rosidl-default-runtime sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ nav-msgs rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "map_msgs" = substituteSource {
      src = fetchgit {
        name = "map_msgs-source";
        url = "https://github.com/ros2-gbp/navigation_msgs-release.git";
        rev = "75add0b73da02b388e25a709aa0e64638374e935";
        hash = "sha256-y6Gf0vfBMW7ShDvgI8gBrUw5wiNjSqB3iga7Y0vR0Fs=";
      };
    };
  });
  meta = {
    description = "\n        This package defines messages commonly used in mapping packages.\n    ";
  };
})
