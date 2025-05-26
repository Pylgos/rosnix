{
  ament-cmake-auto,
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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_sensing_msgs";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_sensing_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_sensing_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_sensing_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "ac8e4e0cd4bd27f8648a8b133d3d19f91c2fb9c3";
        hash = "sha256-vd40z4/ohbjUNdByfBg1SBwSyU/JnwxkS82WYFWp/pE=";
      };
    };
  });
  meta = {
    description = "Autoware sensing messages package.";
  };
})
