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
  version = "5.4.2-1";
  src = finalAttrs.passthru.sources."geometry_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "geometry_msgs" = substituteSource {
      src = fetchgit {
        name = "geometry_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "746275d3a681976cb1a474638c2a4c7ce92e06fe";
        hash = "sha256-1sYA5hXwXFwVGM1TdgRVbZiARc+Cz1PVH8RyHzIHCrc=";
      };
    };
  });
  meta = {
    description = "A package containing some geometry related message definitions.";
  };
})
