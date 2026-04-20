{
  autoware-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "continental_msgs";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."continental_msgs";
  nativeBuildInputs = [ autoware-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ autoware-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "continental_msgs" = substituteSource {
      src = fetchgit {
        name = "continental_msgs-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "63e42e7800a535151557fa5e33e421e7bb4e6a6a";
        hash = "sha256-HDwqQWdowUjEfdd3hgmGM3Z7a4sd/D7QheXcyAXEvCU=";
      };
    };
  });
  meta = {
    description = "Messages for Continental sensors";
  };
})
