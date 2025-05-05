{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
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
  pname = "geometry_msgs";
  version = "5.5.0-1";
  src = finalAttrs.passthru.sources."geometry_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "geometry_msgs" = substituteSource {
      src = fetchgit {
        name = "geometry_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "cfbf47c0dbb5f90192c918d2fec16f17a52e1ac2";
        hash = "sha256-HMT5aUXwwhEmWyp36JIR/yQK+8gzohbswzTkOsKqNdg=";
      };
    };
  });
  meta = {
    description = "A package containing some geometry related message definitions.";
  };
})
