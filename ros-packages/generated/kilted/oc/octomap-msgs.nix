{
  ament-cmake,
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
  pname = "octomap_msgs";
  version = "2.0.1-2";
  src = finalAttrs.passthru.sources."octomap_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "octomap_msgs" = substituteSource {
      src = fetchgit {
        name = "octomap_msgs-source";
        url = "https://github.com/ros2-gbp/octomap_msgs-release.git";
        rev = "c160e5a4dc6358785a766456b971bc01241cdad3";
        hash = "sha256-K+JsNe6XUHfZcd7C4bJTFo1CsVsdOSF/YNIshrKDaq0=";
      };
    };
  });
  meta = {
    description = "\n   This package provides messages and serializations / conversion for the ";
  };
})
